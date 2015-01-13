---
layout: post
date: 2015-01-12 15:31:55 -0800
title: S3 cross domain issue
---

It seems a simple to solve s3 cross domain issue, but I spent a lot of time to fix it. Maybe you will have similar issue, please try my solution if it works, if not, please let me know.

### set cross domain config

To solve S3 cross domain, first you need setup the config on s3 bucket like below:

{% highlight xml%}
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
{% endhighlight%}

See more information from [amazon document](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html#cors-expose-headers). 

### change your code

If you use <img> element to display the s3 image, now it's end. But if you want to Image object to access it you have to continue:

{% highlight js %}
    var image = new Image();
    image.onload = function () {
        // Do what you want
    };
    image.crossOrigin = "Anonymous";
    // such as url="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/pie.png";
    image.src = 'your s3 https image url here';
{% endhighlight %}

You see we have set the image.crossOrigin value. Note you have to use 'https' s3 link, not 'http'. You can find a real case from [this blog](http://blog.codepen.io/2013/10/08/cross-domain-images-tainted-canvas/).

### Trouble Shooting

If you code still cannot work on chrome, maybe you have same issue like me. Actually it seems there is a bug on chrome, because Safari and Firefox work well. In my code, I have a thumbnail image, which is a img element in html page. Once user click the thumbnail I need load that image via Image class to display in WebGL. I always fail to display it in WebGL on Chrome, but it works on Safari and Firefox.

Finally I find this fron stackoverflow: [http://stackoverflow.com/questions/26352083/chrome-cors-cache-requesting-same-file-from-two-different-origins](http://stackoverflow.com/questions/26352083/chrome-cors-cache-requesting-same-file-from-two-different-origins), which shows this is a Chrome bug, but to solve it I add timestamp at the end of image url liek below, so it works.

{% highlight js %}
    var url = "your-s3-image-url" + "?t=" + new Date().getTime();
{% endhighlight %}

