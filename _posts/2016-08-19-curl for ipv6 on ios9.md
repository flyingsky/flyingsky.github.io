---
layout: post
date: 2016-08-19 01:07:43 -0700
title: curl for ipv6 on ios9
categories: home
---

A old ios app is submitted to review with minor changes. But it's rejected because doesn't support ipv6 on iOS9. It shows our app cannot access internet in ipv6 setttings. At the beginning I think it's AWS S3 issue, maybe it doesn't support ipv6. Later I find it's curl lib issue after debug. Actually obviously it should be curl lib issue, because in theory nothing needs to be changed for internet access in ipv6.

# Setup ipv6 debug environment

See detail from [here](https://developer.apple.com/library/ios/documentation/NetworkingInternetWeb/Conceptual/NetworkingOverview/UnderstandingandPreparingfortheIPv6Transition/UnderstandingandPreparingfortheIPv6Transition.html#//apple_ref/doc/uid/TP40010220-CH213-SW1). At the end of this article you can find section "Test for IPv6 DNS64/NAT64 Compatibility Regularly". Don't ask me why you cannot setup it, I just spend some time to upgrade OS X to 10.11 and find a cable to connect to Ethernet.

# Solution for curl lib

We use curl to access internet, because our code is c++. Our curl lib is old, so we have same problem like this: [https://github.com/curl/curl/issues/594](https://github.com/curl/curl/issues/594). That discussion is long and solution is like curl code is right, but you need change your build. I don't know how to build from source, at least after `configure && make` doesn't work, I don't find the output libcurl.a. Thanks for Google, I find this [https://github.com/sinofool/build-libcurl-ios](https://github.com/sinofool/build-libcurl-ios). It even works. I follow that guid to build openssl first, then build libcurl. Copy the include header files and output libcurl.a. That's it, nothing to change. Hope it can save your time.
