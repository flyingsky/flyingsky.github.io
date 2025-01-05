---
layout: post
date: 2024-07-13 10:02:38 -0700
title: Google Top Internal Dev Tools - Section 1
categories: home
---

I joined Google as software engineer in year 2018, about 6 years to today. This is the longest tenure in my career life so far. There are a lot of experiences I could list after these years. We can discuss many topics, like daily work, internal development tools, career growth, salary and compensation, etc. Today we start with some simple topics: the Google internal tools for daily work.

Google is a giant internet company and tons of code. Most dev tools are developed internally. That's why some googlers would say the Google development work is total different to the external. Overall I like all the internal google tools, which are better than most external popular tools in my mind. You can also find some Google internal vs external tools from https://github.com/jhuangtw/xg2xg. Because Google has a lot of internal tools, the Noogler, who is in google less than 1y, has to spend some time to learn how to use them in the beginning.

### No 1: Code Search

Most people should know Google has only a [monolithic code repo](https://research.google/pubs/why-google-stores-billions-of-lines-of-code-in-a-single-repository/). The code search is the engineer swiss knife, which could easily search/browse/navigate/blame all the existing and history code. I was shocked the first time I used code search, especially comparing to the bad experience of [Opengrok](https://github.com/oracle/opengrok) in Uber. Fortunately Uber switches to [SourceGraph](https://sourcegraph.com/), which is closer to the Code Search.

Actually you could get some feeling about Code Search from the [Android Code Search](https://cs.android.com/android). For example, I want to search the java file with `hello` text in the file path `android`, I could use the search like `hello f:android lang:java`, see the result from [here](https://cs.android.com/search?q=hello%20f:android%20lang:java&sq=) and screenshot as below:

![Code Search Result](/assets/2024-07-13-01.png){:width="50%"}

The word `hello` is the text you want to search, the `f` means the file path, the `lang` is the language. You can find more syntax reference from [here](https://developers.google.com/code-search/reference), which has less features in the Google internal Code Search, such as `removed:true` filter to search in the deleted code, `author:` for specific code author, etc.

When you read the code, you could check the file history and blame it like below, you can see the live result from [here](https://cs.android.com/android/platform/superproject/main/+/main:external/icu/android_icu4j/src/main/tests/android/icu/dev/test/util/ICUServiceTestSample.java;l=28;bpv=1;bpt=0).

![Code Search history and blame](/assets/2024-07-13-02.png){:width="50%"}

You may want to share some code pointer like below the line 46-49 at current version to your collegue, you can click the "Links" on the top right and copy the link from the "Line&Commit". With this url, even the head file has newer version and the code is changed, you can still open the specified version to see the same code, for example [this link](https://cs.android.com/android/platform/superproject/main/+/main:external/icu/android_icu4j/src/main/tests/android/icu/dev/test/util/ICUServiceTestSample.java;l=46-49;drc=fce94e55271644955506c54c41d2e882ffbb8da8) points to the code in the below screenshot.

![Code Search Links](/assets/2024-07-13-03.png){:width="50%"}

If you click the method, such as the `hello()` in the below screenshot, you can see the refrences are listed. For example the `ICUServiceTestSample.java` has `display()` method, which calls the `service.hello()`. If you click the little triangle next to the `73: display() {`, it will show the callee which calls the `display()` method. This is very helpful to browse the code.

![Code Search Links](/assets/2024-07-13-04.png){:width="50%"}

The monolithic repo a lot of famous 3rd party code from the open source community, for example d3.js, react.js, etc. If you want to use some new 3rd party library, it should follow some process to request the approval. So most time if some library is not that popular, it's easier to write your own code from ground. Fortunately you're not alone because Google has so many employees, which means most time some other people may already write those code so you could easily use it.

### No 2: Cider-V

Google invest on the browser based or Cloud IDE for a long time, the old version is Cider based on the internal infra, the latest version is Cider-V based on the open source Visual Code, so the UI is very similar to the VSCode. The benefits you could get are: 

1. You could develop from any device if it supports browser. That's why some developers use chrome book in Google. If you forget your own device at home, you could grab any loan chrome book from the Google office to start coding.
2. No extra setup when you upgrade your device.
3. Consistent user experience from any device.

Now the Cloud IDE is not that new any more, such as [CodeSandbox](https://codesandbox.io/), [Google IDX](https://idx.google.com/), Google Cloud Shell Editor, AWS Cloud9, etc. Here we just briefly introduce some major features from Google internal IDE Cider-V.

1. Support all google code change. It's easy to locate any file in google monolithic repo. That's totally different to the several files change like jsfiddle, jsbin, etc.
2. Support most development languages used in Google, such as c++, java, objective-c, go, python, js, html, css, etc. And the editing is fast. Maybe it's not as fast as some native editor, but it's fast enough.
3. Version control integration with Google's Piper, which is similar to Git, but it's easier than git.
4. Code review integration with Google's Critique, which will be introduced later.
5. Support VSCode extension and all other VSCode advantages like fast keys, etc, beause it's based on VSCode.
6. Support iOS development but it requires XCode installment in local. Similar to Android development. This is the big limit for the mobile development, which means you always require high performance device. I do Android/iOS development, so I need the Macbook Pro.
7. Integrates with many Google internal tools, like build tool, bug tracking tool, etc. As a Noogler, it's very hard to believe all the google code is build on the server side, which seems is very slow comparing to the client side building. For example, I have a nodejs project in local. In development time, the web server is running in local, the client or web server code change could be real time refreshed in my browser, because everything builds and runs in local. But it's a different development mode in Google. Everything is in Cloud. I change the code in the browser, the code is sync to your server, then builds and runs in the server side. It always needs longer time to see the changes, especially you change some code which has a lot of dependencies. If the local latency is less than 1s, the google development requires 5s. Similar to the unit test. But eventually you will get use to it. If it's building slowlly, just go to grab a coffee or have a chat with your colleagues.
8. Code assistant. It helps in some cases, but I don't think it's close to do some real job because it's hard to understand the whole project context. You know each project in Google is very complex. So you can only use it to write some simple isolated util function.
9. Debug is always not easy. I feel only iOS debugging is good enough, which is similar to the XCode. The best solution for server code debugging is console.log because the micro services architecture in google is very hard to support debugging. If you depends on step by step debug a lot, you may need to fallback to the old time, console.log. That's a nightmare, but you will get used to it. Also you may need depend on your unit test more.
