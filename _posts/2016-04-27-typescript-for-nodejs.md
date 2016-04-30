---
layout: post
date: 2016-04-27 13:30:43 -0700
title: typescript-for-nodejs
---

## ts-node

## typings
### typings install
By default use `typings install --save --ambient {your-lib-here}`, which will only install that type declaration file. Also add one entry in typings.json under `ambient` section. You can notice the declaration file is from [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped), which is declaration file repository for deprecated type manager tsd. Because DefinitelyTyped is global, so you can only use as ambient. Your target library dependencies declaration file should be installed by `typings` manually. Such as `typings install --save --ambient express`, then you also need install express dependencies `typings install --save `

Command `typings install --save` install declaration file for target lib and dependencies.


{
  "ambientDependencies": {
    "body-parser": "registry:dt/body-parser#0.0.0+20160317120654",
    "cookie-parser": "registry:dt/cookie-parser#1.3.4+20160316155526",
    "express": "registry:dt/express#4.0.0+20160317120654",
    "express-serve-static-core": "registry:dt/express-serve-static-core#0.0.0+20160322035842",
    "gulp": "registry:dt/gulp#3.8.0+20160316155526",
    "mime": "registry:dt/mime#0.0.0+20160316155526",
    "morgan": "registry:dt/morgan#1.2.2+20160317120654",
    "node": "registry:dt/node#4.0.0+20160423143914",
    "serve-favicon": "registry:dt/serve-favicon#0.0.0+20160316155526",
    "serve-static": "registry:dt/serve-static#0.0.0+20160317120654"
  },
  "devDependencies": {},
  "dependencies": {
    "gulp": "registry:npm/gulp#3.8.0+20160211003958"
  }
}
