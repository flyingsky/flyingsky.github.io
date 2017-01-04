---
layout: post
date: 2016-09-09 16:13:05 -0700
title: dropbox sucks
---

Several years ago I thought Dropbox is cool when I first used it, cool and clean UI, easy to use on Mac. But these two days I tried to sync some folder from Linux, I have hell experience, not only because of the market, but also it's product.

## Dropbox sync app on Linux
I download it from [https://www.dropbox.com/install?os=lnx](https://www.dropbox.com/install?os=lnx), but when I launch it I don't see the link I can access. But it seems working. I try to check where the files are in Dropbox. Because I have team account, I tried several accounts but nothing. Later I use [dropbox cli](https://www.dropbox.com/en/help/9192), I saw files were still being uploaded.

I stop it, from [here](http://www.dropboxwiki.com/tips-and-tricks/install-dropbox-in-an-entirely-text-based-linux-environment) i know maybe before someone setup some account on that Linux server, so I tried to unlink it with tool dbreadconfig.py, but it's deprecated. Ok, I find updated script from [here](http://www.dropboxwiki.com/dropbox-addons/pydropboxvalues), still doesn't work. That page is updated at 2013, now it's 2016, and dropbox sync app version is 9.4.49. So I don't have way to unlink my account. What I need to do??? Search by google, search on Dropbox forum, nothing! I ask question, no answer.

I tried to remove .dropbox folder, and run .dropbox-dist/dropboxd, I saw that link. So I can bind the account finally.

## Sync
I could sync now, after some time I was told cannot sync because no enough space on disk! Actually my disk still has 400G. Stupid! So I have to stop to use sync, I find one [shell script](https://github.com/andreafabrizi/Dropbox-Uploader) to upload files.

## Why
I don't know why Dropbox sync app is so poor, and why it's so hard to use. Why dropbox forum or support is so sucks? It seems they don't have enough time or resources to support clients. Why don't use AWS S3 instead, it has tools, if there is no tools, you can have API to build tool. I agree with this opinion [Dropbox will die](https://alexdanco.com/2015/08/24/dropbox-the-first-dead-decacorn/)
