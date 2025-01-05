---
layout: post
date: 2015-04-01 10:51:39 -0700
title: How To Write Chinese Characters
categories: home
---

You can find a good online chinese dictionary from [here](http://www.zdic.net/z/25/js/8FA8.htm), but this site only provides the flash file to teach you how to write a Chinese character. To support most mobile devices, we can use [Google Swiffy](https://developers.google.com/swiffy/) to convert it into html5.

### How to do it

First you can use Chrome Developer tool to check the swf for the character. For example, the previous page uses [8FA8.swf](/assets/8FA8.swf), the unicode of that character.

Second download that swf and upload to [Google Swiffy](https://developers.google.com/swiffy/convert/upload). Unbelivable it works!!! I can download the html5 files. Actually it only use the swiffy runtime js library, and Swiffy generates some data based on the swf file. Now you can check the html5 result [here](/assets/8FA8.html).

In conclusion, can we do something based on that?
