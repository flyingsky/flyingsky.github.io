---
layout: post
date: 2016-12-31 08:24:47 -0800
title: Minimize Webpack JS bundle size for ReactJS
---

I noticed my Webpack js bundle size is 1.2MB for a long time, recent holiday finally have time to solve it and it was 788kb after some improvement, after gzip it was just 215KB.

As I know ReactJS min file is just 135KB, why bundle file is so large, even I don't have a lot of code. Most articles online just suggest use webpack config, like `NODE_ENV=production` and `-p`, and minify. Because I use this [react seed](https://github.com/badsyntax/react-seed) to create my project, so they are already in my project. Because I use some third party library. I think every ReactJS project has a lot third party libraries, if it happens on me, it should happens on every project. I want to know which third party lib contributes the the most size, google "reactjs webpack bundle file size analyze" and find this tool [webpack-bundle-size-analyzer](https://github.com/robertknight/webpack-bundle-size-analyzer).

### Run analyze

```
npm install -g webpack-bundle-size-analyzer
webpack --json | webpack-bundle-size-analyzer
```

If you install webpack in local directory, not global, you need use webpack like `node_modules/.bin/webpack`, if your webpack doesn't support `--json` you have to upgrade your webpack. After you run above script, you may see something like below:

```
react: 641.95 kB (55.3%)
  <self>: 641.95 kB (100%)
chai: 125.8 kB (10.8%)
  deep-eql: 7.51 kB (5.97%)
    type-detect: 2.72 kB (36.2%)
      <self>: 2.72 kB (100%)
    <self>: 4.79 kB (63.8%)
  assertion-error: 2.29 kB (1.82%)
    <self>: 2.29 kB (100%)
  <self>: 116 kB (92.2%)
flummox: 73.46 kB (6.33%)
  flux: 9.01 kB (12.3%)
    <self>: 9.01 kB (100%)
  eventemitter3: 5.94 kB (8.08%)
    <self>: 5.94 kB (100%)
  uniqueid: 947 B (1.26%)
    <self>: 947 B (100%)
  object-assign: 484 B (0.643%)
    <self>: 484 B (100%)
  <self>: 57.12 kB (77.8%)
q: 58.84 kB (5.07%)
  <self>: 58.84 kB (100%)
...
<self>: 195.57 kB (16.9%)
```

From it, you can see lib react contributes 55.3%; lib chai contributes 10.8%, in which deep-eql contributes 5.97% and assertion-error contributes 1.82% and itself(self in above) contributes 92.2%, 5.97% + 1.82% + 92.2% = 100%.

Base on this analytics, you can see which library contributes a lot. If you may be surprised by some common library, such as lodash, moment.js, even you just use some of them. Now let's continue to how to solve it.

### Minimize lodash
In usual you just import lodash like `import * as _ from 'lodash'`, so webpack will compile all lodash js into your output js bundle. The problem here is you may only use some of lodash lib like `groupBy`, `forEach`. So what you have to do is change the import like below:

```
import groupBy from lodash/groupBy
```

If you do this change, and run the bundle size analytics, you will find lodash doesn't contribute a lot now.

Same to library `react-bootstrap`, you should import the component you used, not the whole react-bootstrap like below:

```
import Accordion from 'react-bootstrap/lib/Accordion';
```

### Minimize moment.js
If you use moment.js, in most time you don't need the locale files, so you need ignore them. To ignore them you need add below webpack plugin:

```
new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/) // Ignore all optional deps of moment.js
```

### Zip you js bundle
After above steps, my minified js bundle from 1.2MB to 788K, reducing 33%. I try to zip the js bundle, it becomes 215KB. Woo, that's what I want to achieve. AWS CloudFront has this feature to auto compress file if request supports gzip. So I deploy my js into AWS S3 and sync it to CloudFront, then use that js in my index.html. There is another different problem to use CloudFront, it suggests to version your file, which means you need add version number to your files. Obviously it make sense to js/css, but if we add version number to index.html, then we cannot access it via url xxx/index.html. So I still access index.html from s3 bucket which serve as static website, but use CloudFront as js/css CDN. But read next blog you can find I have new idea to solve this problem.

### More
To make single page app faster, I think there is still something to do:
1. Separate vendor bundle and app bundle, because vendor bundle is not change often.
2. Try [preact](https://github.com/developit/preact) and [trixion](https://github.com/mrbar42/trixion). I think preact is a good way, but why it doesn't compatible to ReactJS. Or either way, is it possible to improve ReactJS size?
