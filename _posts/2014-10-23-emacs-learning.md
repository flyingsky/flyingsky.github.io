---
layout: post
date: 2014-10-23 11:23:38 -0700
title: emacs-learning home
---

You can download purcell emacs.d from [here](https://github.com/purcell/emacs.d). It's really a good emacs configuration. I like use it. And the most important thing I learnt is use 'M-x' to select your command to avoid rememeber fast key.

### Tips to use purcell emacs.d

1. `C-x C-f` will list all matched files. To create file, you should enter `C-j`. To open dired directory you should enter `C-d`.
2. `M-x forward-expr` go to matched parenthesis, and `M-x back-expr` go back to matched parenthesis.
3. `C-x h` select whole text

### Region

1. `C-space` start to mark region, type again to cancel region
2. `C-space C-space` save your position, and move to other places, now `C-u C-space` to back to previous position
3. `C-x C-u` upper case region
4. `C-x C-l` lower case region
5. `C-w` kill region
6. `M-w` copy region
7. `C-u C-space` back to previous region, and `C-x C-x` to high previous region

### Dired Buffer

1. `g` update buffer
2. `D` remove the file in current line
3. `d` flag file; `x` remove flagged files.
