---
layout: post
date: 2026-05-19 10:02:38 -0700
title: Google Top Internal Dev Tools - Section 2
---

I joined Google as software engineer in year 2018. This is the longest tenure in my career life so far. There are a lot of experiences I could list after these years. We can discuss many topics, like daily work, internal development tools, career growth, salary and compensation, etc. Today we start with some simple topics: the Google internal tools for daily work. I have https://flyingsky.github.io/2024/07/google-top-internal-dev-tools-1.html for the first introduction of google internal tool. Today we introduce something else.

### No 3: Piper and Fig
Google doesn't use git, instead it uses its own massive centralized version control Piper to manage its mono repo. The mono repo means most of Google code, like YouTube, Cloud, Search, Ads, etc. Some Alphabet child organization may host the code in Github, such as the Google X, Wing, etc. Github may not support mono repo like Google size. For example, when I tried to implement the vitest visual regression test, I have to consider the github repo size for screenshot generation like https://vitest.dev/guide/browser/visual-regression-testing.html#use-git-lfs. But Google Piper never worries about this.

Fig is the client of Piper. It integrates with Google online code editor, Cider and Jetski, internal AntiGravity. So you can use visual tool to create your CL(code changes, similar to git commit). Based on one CL, you can create another child CL for another task. If these two CLs don't have any dependencies, you can create the second CL based on the same latest server code. Fig provides UI to combine multiple liner CLs into one, or split one CL to multiple liner CLs so you can submit the code review for small CL. Google recommends small CL, every CL only solves one problem, so the reviewer can easily review and approve it. As a Noogler(new google engineer) it's easy to create a large CL, and the reviewer will always suggests to break it into small CLs.

Fig also provides UI tool to rebase one CL to another CL, so it's easy to move the CL. All these features could be found by [git-branchless](https://github.com/arxanas/git-branchless), such as `git move`, `git record`, `git amend`, `git reword`, `git split`. But you have to use command line. For me, I like the UI tool because it's easy without any memory of commands.

### No 4: Snipit and Screencast
Snipit is a Chrome extension to take a screenshot of your browser or desktop window and save it online. Once the screenshot is generated, you can draw some arrows/shapes and some text to the screenshot, then you can share it. It's very useful to share the issue and data.

Screencast is another Chrome extension to record video for your browser or window. It's helpful to show the step how to reproduce some bugs or complex workflow.

I find a good alternative out of Google is [Awesome Screen Recorder & Screenshot
](https://chromewebstore.google.com/detail/awesome-screen-recorder-s/nlipoenfbbikpbjkfpfillcgkoblgpmj). The problem is it's not very easy to share the link. You have to pay for it or save it to your google drive. But it works.
