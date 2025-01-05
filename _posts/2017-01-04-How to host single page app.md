---
layout: post
date: 2017-01-04 01:02:48 -0800
title: How to host single page app
categories: home
---

Github IO Page or AWS S3 and CloudFront.

### Github IO Page
1. Easy to setup and deploy, just use git, and free.
2. Have many theme
3. Custom domain, but doesn't support https for custom domain.
4. Set `permalink` in `_config.yml` to solve the SPA route issue.
5. Support multiple version for js/css, but index.html only has 1 version, but it can updated.

### AWS S3 and CloudFront
1. You have to pay.
2. Upload everything in S3, and sync to CloudFront as CDN.
3. S3 host as static web site, set error page to index.html for spa.
4. use custom domain via CloudFront, support https.
5. CloudFront can support version file, but hard to sync index.html, use lambda@edge.
