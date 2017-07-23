---
layout: post
date: 2017-07-23 15:02:48 -0800
title: Let's encrypt for S3
---

Suppose you already know how to host static web site via AWS CloudFront and S3, and you have your own domain name, now you want to have SSL to support https. As developer, I like to use free resources to do everything, like this site with github, and [Lets Encrypt](https://letsencrypt.org/) for SSL.

### Setup your static web site with CloudFront and S3
See more detail from [this article](http://flyingsky.github.io/2016/03/21/host-angularjs-with-s3-and-cloudfront/)

### Create SSL
To use letsencrypt to create SSL for S3, you need [certbot-s3front](https://github.com/dlapiduz/certbot-s3front). It makes the whole process is very easy, it just installs some lib and run some commands, that's it. Detail steps are below for Mac.

1. `brew install certbot`
2. `pip install certbot-s3front`
3. Run below command to create and deploy ssl to CloudFront. You have to replace the parameters properly, including the "www.teeterpal.com".

```
sudo AWS_ACCESS_KEY_ID="Your-Key" \
AWS_SECRET_ACCESS_KEY="Your-Access-Key" \
certbot --agree-tos -a certbot-s3front:auth \
--certbot-s3front:auth-s3-bucket www.teeterpal.com \
-i certbot-s3front:installer \
--certbot-s3front:installer-cf-distribution-id {Your-Distribution-Id} \
-d www.teeterpal.com
```

Then you can access our site https://www.teeterpal.com. If it doesn't work, you can check if your site works well without SSL before.

### Auto renew
To automate the renewal process without prompts (for example, with a monthly cron), you can add the certbot parameters `--renew-by-default --text`. Or even run above command to generate new SSL key, it will prompt "do you want to renew your SSL". LetsEncrypt's SSL is expired every 6 months. I have no idea how easy to regenerate automatically every 6 months without a dedicated EC2 instance. 
