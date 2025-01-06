---
layout: post
date: 2016-05-17 07:24:09 -0700
title: "DotNet: I'm back"
categories: home
---

A side project requires Asp.Net. I don't want to go back to DotNet, though it's a good platform, but I don't touch Windows for 4 years, I don't use it for 8 years. Now I cannot image work with Windows, not Mac. As an engineer, we should keep curiosity for everything, right? The more important is Windows changes a lot in recent year, more open. That's why DotNet can work on Mac. Now let's setup everything on Mac.

## Update 1/6/2025
I just noticed this blog was not finished yet because I'm too lazy. I didn't spend much time on the dotnet work because the owner thought it was too expensive to maintain that website. I try to find the old website but it seems the domain is changed and the old website is gone for some time. It's not easy to survive for a startup, no matter how awesome your slogan if you could not provide useful service. AI, Web3, Crypt currency/token, ... may help you to get the fund, but it's just the beginning. If you don't have any plan or insight for the future, just work for a big company to climb the career ladder. Different living style, not big difference.

## Your First ASP.NET app on Mac
Just follow [this article](https://docs.asp.net/en/latest/tutorials/your-first-mac-aspnet.html) to setup. Here I just mentioned some pitfall you should notice during the whole setup. So you just need to check below points when you cannot continue based on the original article.

1. `cannot find command 'dotnet'`. After you install dotnet sdk, you have to launch a new terminal to test the command `dotnet -v`, because it seems the path environment only works in new terminal, not old terminal before you install.

2.