---
layout: post
date: 2018-01-26 23:26:42 -0700
title: Javascript Detect Chinese and Japanese Characters
categories: home
---

ElasticSearch search behavior is so weird. It works well to search any language except Chinese and Japanese, like Chinese "餐馆" and Japanese "大戸屋". The workaround in front end is add double quotes to those characters. In usually Chinese, Japanese and Korean are named CJK, which are similar, but Korean it seems works fine. So here we discuss about how to detect Chinese and Japanese in JS.

###  Check Japanese

    {% highlight js %}
    const REGEX_JAPANESE = /[\u3000-\u303f]|[\u3040-\u309f]|[\u30a0-\u30ff]|[\uff00-\uff9f]|[\u4e00-\u9faf]|[\u3400-\u4dbf]/;
    const hasJapanese = (str) => REGEX_JAPANESE.test(str);
    {% endhighlight %}

You can find detail from [stackoverflow](https://stackoverflow.com/a/15034560).

### Check Chinese

    {% highlight js %}
    const REGEX_CHINESE = /[\u4e00-\u9fff]|[\u3400-\u4dbf]|[\u{20000}-\u{2a6df}]|[\u{2a700}-\u{2b73f}]|[\u{2b740}-\u{2b81f}]|[\u{2b820}-\u{2ceaf}]|[\uf900-\ufaff]|[\u3300-\u33ff]|[\ufe30-\ufe4f]|[\uf900-\ufaff]|[\u{2f800}-\u{2fa1f}]/u;
    const hasJapanese = (str) => REGEX_CHINESE.test(str);
    {% endhighlight %}

You can find detail from [here](https://github.com/alsotang/is-chinese/blob/master/ischinese.js). Actually both are simple regex, but to check unicode. If you know the unicode range for each language, then it's easy to do. I spent a lot of time to figure out the regex for Chinese. Let's discuss detail.

### Unicode Regex

In Javascript, we have several way to represent string like below:

    {% highlight js %}
    const a = 'A';
    // hexadecimal escape for code point between U+0000 to U+00FF
    const b = '\x41';
    // Unicode escape for code point between U+0000 to U+FFFF
    const c = '\u0041';
    // Unicode code point escape for any code point up six hexadecimal digits for all unicode code point
    const d = `\u{0041}`
    const isTrue = a === b && b === c && c === d;
    {% endhighlight %}

Why do we need unicode code point escape? Because we need support code point more than 4 hex digits, like below or the range for Chinese character used in `REGEX_CHINESE`. Let's have another example below

    {% highlight js %}
    const a = '\u{1f4a9}';
    const b = '💩';
    const c = '\uD83D\uDCA9';
    console.log(a === b && b === c);    // true
    console.log(a.length === 2);        // true
    console.log(a.charCodeAt(0).toString(16), a.charCodeAt(1).toString(16));    // d83d, dca9
    // I think a.codePointAt(1) should be null, but why it's `dca9` and codePointAt(2) is undefined.
    console.log(a.codePointAt(0).toString(16), a.codePointAt(1).toString(16)); // 1f4a9, dca9
    {% endhighlight %}

Now we understand why have `\u{20000}` in Chinese regex, not `\u20000`. This is a very [nice article](https://mathiasbynens.be/notes/javascript-unicode#regex) to introduce detail of Javascript unicode.

Also add `u` flag on regex to show ["unicode; treat pattern as a sequence of unicode code points"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp).