---
layout: post
date: 2016-03-21 14:09:23 -0700
title: host angularjs with s3 and cloudfront
categories: home
---

For SPA application like AngularJS project, it's easy to use s3 to host it. But if you want to use SSL, you have to use CloudFront for help, because S3 doesn't support SSL directly. But there is some special issue to solve when you host AngularJS project, such as url issue for html5mode and enable SSL for CloudFront.

## Start
There is a great blog to introduce how to set up everything, just follow [Setting Up SSL on AWS CloudFront and S3](https://bryce.fisher-fleig.org/blog/setting-up-ssl-on-aws-cloudfront-and-s3/), you can have s3 to host your AngularJS SPA.

## AngularJS html5mode
The problem is AngularJS only has one entry point is your index.html, other url is just route for your Controller in AngularJS 1.x or Component in AngularJS 2.0. So they are not real assets. S3 is just a host which just response the real assets. For this case we can use S3 error page, you can set on your s3 bucket properties, `Static Website Hosting` -> `Enable website hosting` -> `Error Document`, set it to 'index.html' or any your AngularJS entry html page.

This only solve the s3 issue if use s3 website url, not your own domain supported by CloudFront. To solve the CloudFront issue, you can ignore S3 settings, just select your CloudFront distribution, `Error Pages` -> `Create Custom Error Response`, on the settings page:

1. HTTP Error Code: 403 Forbidden
2. Error Caching Minimun TTL: keep default value 300
3. Customize Error Response: select `Yes`
4. Response Page Path: /index.html
5. HTTP Response Code: 200: OK

After some time the settings effect(you can check the distribution page to check if it's effect, which is not effect if it display "in progress"), you can refresh any html5mode link, it should work.
