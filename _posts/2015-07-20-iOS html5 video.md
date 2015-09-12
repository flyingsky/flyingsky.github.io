---
layout: post
date: 2015-07-20 23:26:42 -0700
title: iOS html5 video
---

Some iOS html5 video experience. Actually I spent much time to handle some special cases for iOS html5 video element, but always forget after finishing my work. Next time I need to spend time to figure out the same issue. Now blog it to avoid to forget it again :)

###  Hide the play button on video center

This only works on iOS 8+, becuase lower version cannot find related shadow dom element.

    {% highlight css %}
    ::-webkit-media-controls-start-playback-button {
        display:none !important;
    }
    {% endhighlight %}

### No touch event invoked when button on top of video element on iOS 7 and below.

I don't find the real reason, but to solve this issue I have to hide it first, or move it to other place, when you click your own play button, then show it or move it back.

### Video plays only invoked by user click manually

Video on iOS cannot be played automatically, because sometimes user uses cellular data, to save user's money, video/audio only plays when use click it manually. If you want to use the play method of video/audio, you have to put it into the user's manually click event handler. For example:

    {% highlight html %}
    <button onclick="playVideo()">Play Video</button>
    {% endhighlight %}
    
    {% highlight js %}
    function playVideo() {
        var video = document.getElementById("yourVideoId");
        video.play();
    }
    {% endhighlight %}
    
You cannot play video in ajax callback, because it's not in out of event handler. For example, in my case, when user click my play button, I will ask server to unzip a package which contains the target video, when it's unzipped and uploaded to s3, I will start to play that video.

The solution is call video.play before your ajax call in the click event handler. Now the video has nothing to play, because the video.src is empty. Then call ajax to get video information, when the response is back, set video.src correctly.

    {% highlight js %}
    functio playVideo() {
        var video = document.getElementById('yourVideoId');
        video.play(); // make sure your video.src is empty
        $.ajax('xxx', function() {
            // now you can update video.src to start to play the video
            video.src = 'your video source';
        });
    }
    {% endhighlight %}


Same to AudioContext.

### Resources
[Apple iOS html video](https://developer.apple.com/library/safari/documentation/AudioVideo/Conceptual/Using_HTML5_Audio_Video/Device-SpecificConsiderations/Device-SpecificConsiderations.html#//apple_ref/doc/uid/TP40009523-CH5-SW1)






