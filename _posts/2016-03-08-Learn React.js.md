---
layout: post
date: 2016-03-08 17:00:35 -0800
title: Learn React.js
---

Finally have chance to learn React.js, because we need choose one from Angular.js 2 and React.js. To learn React.js, I find some good articles to start.

1. [React.js website](https://facebook.github.io/react/)
2. If you don't understand whole stuff, you can see some easy and good articles [Start React.js](https://scotch.io/tag/react)
3. [Flux](https://facebook.github.io/flux/docs/overview.html#content). You can read one Flux implementation from Facebook [github](https://github.com/facebook/flux). Or even another alternative [Redux](https://github.com/reactjs/redux)
4. [Async Request with React.js and Flux](http://www.code-experience.com/async-requests-with-react-js-and-flux-revisited/). This article provides a clear way to solve when to do the async ajax request. Always make sure store/action return in sync. If we need async ajax request, we can use action to notify store to update state first to show it's ajax requesting. Then launch an async request in another class, who is responsible to do the detail ajax request and parse data. When data comes back, do another action to notify store the data is back with success or error, so the store can update state and invoke UI render.
5. [Redux](http://redux.js.org/docs/basics/index.html). You have read one of Flux implementations: Redux. It's very cool and simple. After you read the basics, you have to download the source code and read it, nothing is magic.
6. [Redux Async Example](https://github.com/reactjs/redux/tree/master/examples/async). In Redux, the async ajax request is handled in reducer, which is responsible to handle Action. This doesn't conflict to #4. Because #4 is based on original Flux proposal, but Redux has further separate: Action is just simply Action generation which contains type and necessary parameters; Reducer is in store and it is responsible to response to all kinds of Actions. The most important thing is Redux and #4 both require separate Action to dispatch for async Ajax request and Ajax response parse.
7. [Redux Real World Example](https://github.com/reactjs/redux/tree/master/examples/real-world). A complex example to show how to use Redux React in real project.
8. [React Router]()
9. [React Redux](https://github.com/reactjs/react-redux) Redux binds with React. Note Redux is a simple lib or architect for any UI framework, AngularJS or React.

After read all of above you can understand what's React and how to use it to build big app based on Flux architecture. I think #4 is very important to figure out how to use ajax to call web service.
