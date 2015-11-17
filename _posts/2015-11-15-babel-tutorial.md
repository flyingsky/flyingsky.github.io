---
layout: post
date: 2015-11-15 21:27:22 -0800
title: Babel Tutorial For NodeJS
---

Babel.js is a js compiler which translates ES6 to ES5 which is implemented by all moreden browsers. Actually babel.js should be gone when ES6 is supported by most browsers. But before that, babel.js can help us to use ES6 new features before that happens. Why do we need use ES6 features right now? Because ES6 make our life easier for javascript.

## setup with grunt

1. `npm install grunt-babel --save-dev`, which install grunt-babel task but it's useless unless you install babel plugins.

2. `npm install babel-preset-es2015 --save-dev`, which install preset plugins

3. `npm install babel-plugin-transform-runtime --save-dev`, which installs plugin to support babel runtime.

4. `npm install babel-runtime --save`, which installs babel-runtime as dependency

5. Add ".babelrc" file and add below code:

   {% highlight javascript %}
   {
        "presets": ["es2015"],
        "plugins": ["transform-runtime"]
   }
   {% endhighlight %}

6. Add below code into Gruntfile.js

{% highlight javascript %}
// load all grunt tasks, which requires you install matchdep module, `npm install matchdep --save-dev`
require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
grunt.initConfig({
    "babel": {
      options: {
        sourceMap: false
      },
      dist: {
        files: [{ // compile all server/**/*.es6.js to dist/*.js
          expand: true,
          cwd: 'server',
          src: ['**/*.es6.js'],
          dest: 'dist',
          ext: '.js'
        }]
      }
    }
});
{% endhighlight %}

Note we install babel-runtime as dependency, because babel has some common code like library, such as library to support ES6 "class". If we don't use babel-runtime and babel-plugin-transform-runtime, everytime you define "class", babel would generate related code to support class. Obviously it generate a lot duplicate code if you have class in different files. Such as classA.js defines ClassA,  classB.js and classC.js extend ClassA. Then each file will have class related support code. To avoid this, we add babel-runtime module, then all class related code in babel-runtime module.

## Try to use babel.js

1. Add classA.es6.js

{% highlight javascript %}
export default class A {
  constructor(name) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  shout() {
    console.log(this.getName());
  }
}
{% endhighlight %}

2. Add classB.es6.js

{% highlight javascript %}
import A from './classA.js';  // note we transpile classA.es6.js to classA.js

export default class B extends A {
  constructor(name) {
    super(name);
  }

  getName() {
    return "B => " + super.getName();
  }
}
{% endhighlight %}

3. Add app.es6.js to use classB

{% highlight javascript %}
import B from './classB.js'
new B('bbb').shout(); // output 'B => bbb'
{% endhighlight %}


If you run `grunt babel` it should generate correct code

