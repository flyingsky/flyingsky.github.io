---
layout: post
categories: grunt nodejs home
---

[Grunt](http://gruntjs.com/) is a very cool task runner tool, like [Ant](http://ant.apache.org/) in java world. Now introduce how to automatic all nodejs web work, ExpressJs and Angular. From it you can learn much basic important grunt skill to use in your real project development.

### Dev directory structure

{% highlight js %}
// Project Folder
    --package.json
    --Gruntfile.js   
    --client
	|--app   // for all js/ts code
	|--public
		|--stylesheets
		|--other-assets
	|--vendor
    --server
	|--app.js
	|--config
	|--lib
	|--routes
	|--test
	|--views
    --node_modules
    --dist
	|--app.js
	|--lib
	|--routes
	|--views
	|--public
	|--test
{% endhighlight %}

Actually my original dev directory structure is like dist as a normal ExpressJS project. But as our client code is more and more complext, I need separate client and server code. Another requirement is to support typescript. I don't want to mix ts and js file together. So I want make client/server just for ts code, and dist contains final output js code. Same to compass/sass to generate stylesheets.

As the Gruntfile.js and package.js both are on the project root, because Gruntfile.js have to be in the root directory when we run the command `grunt` under the project root directory. The file package.json describes what dependency npm modules we have used, including grunt plugins.

The client code can be more clearly if we use bower to solve the dependency issue, then the vendor directory will be gone and bower.json will be added. Now we ignore it because it's not to difficult to do.

Now what I want to do is:

1. Combine client/server output to dist and make it looks like ExpressJS default structure, i.e. the server code copy to the dist directly, excluding server/test; The client side all js/ts under app directory and js under vendor directory would be copied/compiled to public/javascripts.

2. Watch any changes in client and server directories, copy related changed files into dist and restart ExpressJS server.

3. Support mocha test.

4. Deploy code into AWS Elastic Beanstalk.

### Add grunt dependency

We have to add all dependency grunt plugins into devDependencies in  package.json, because it's only used in dev, not production. You can find more grunt plugins from here <http://gruntjs.com/plugins>. Especially grunt plugin named as "grunt-contrib-xxx" is reserved for grunt team.

{% highlight js %}

{
"devDependencies": {
    "mocha": "~1.20.0",
    "grunt": "~0.4.1",
    "grunt-contrib-copy": "~0.4.1",
    "grunt-contrib-concat": "~0.3.0",
    "grunt-express-server": "~0.4.19",
    "grunt-contrib-clean": "~0.4.1",
    "grunt-contrib-watch": "~0.6.0",
    "grunt-contrib-compress": "~0.12.0",
    "grunt-awsebtdeploy": "~0.1.0",
    "grunt-mocha-test": "~0.12.0",
    "matchdep": "~0.1.2",
    "grunt-typescript": "0.3.8",
    "grunt-env": "~0.4.1"
  }
}

{% endhighlight %}

Next run `npm install` to install all dependency plugins. Note we add "grunt", which is actually the grunt runner. But to run it, we should have install grunt-cli, which is command line tool to launch grunt. Why? Because grunt runner may have different versions for different projects, but grunt-cli usually same, and each project has its own grunt.

To install grunt-cli by running `npm install -g grunt-cli`, which install grunt-cli as global module. So you can run it anywhere. Now run `grunt -v` you can see some grunt-cli version information.

### Add Gruntfile.js

Now we can create a Gruntfile.js in your project directory, which defines all your tasks. It looks like below:

{% highlight js %}
module.exports = function (grunt) {
  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    copy: {
  	  clientjs: {
        files: [{
          expand: true,
          cwd: 'client',
          src: ['app/**/*.js', 'vendor/**/*.js', '!app/test/**/*.js'],
          flatten: true,
          dest: 'dist/public/javascripts'
        }]
      }
    }
  });

  grunt.registerTask('default', ['copy:clientjs']);
};

{% endhighlight %}

Now you can run `grunt default` or `grunt`, you can see all js files under app and vendor, excluding the test js files under app/test, are copy to dist/public/javascripts.

Now analyze the Gruntfile.js. First load all dependent plugins with grunt.loadNpmTasks. Alternative you can load each plugin one by one manually.

Second init config, which is a normal js object. You can define any tasks. Such as we use copy task defined in [grunt-contrib-copy plugin](https://github.com/gruntjs/grunt-contrib-copy). Task `copy` is a multiple task, in another word you can define many sub tasks in it, such as we define clientjs sub task. We use `copy:clientjs` to refer to it. In the clientjs sub task, 

### Output dist

### Watch file changes and restart Express

### Mocha test

### Deployment

### More resources

1. <http://gruntjs.com/getting-started>
2. <http://www.justinmccandless.com/blog/A+Tutorial+for+Getting+Started+with+Grunt>
3. <http://blog.millermedeiros.com/node-js-ant-grunt-and-other-build-tools/>
