---
layout: post
date: 2015-11-17 12:59:40 -0800
title: Emacs yasnippet
---

Emacs yasnippet provides a lot of snippets for different program language, even markdown file. Also you can add your snippets if you like. For example, when I write blog with code, I don't want to enter {% raw %} "{% highlight javascript %} {% endhighlight %}" {% endraw %} everytime, with yasnippet help, I just need enter `highlight` then press 'Tab', the highlight snippet code is generated automatically.

To make your emacs easy to use, I strongly suggest you use existing good emacs configuration if you are junior emacs user, like [Steve Purcell](https://github.com/purcell/emacs.d). You can find detail how to install and use it from previous link. This configuration sets up a strong tool ido, which helps you to easy find your file. But sometimes it's annoy when you want to open a directory or create a new file.

In ido mode, to create a new file you can enter `C-x C-f` to find the directory you want to save to, then enter `C-f` again to switch to normal mode, then you can continue enter your file name to create a new file.

In ido mode, to open directory you can enter `C-x C-f` to find the directory first, then enter `C-d` to open that directory.

You can find more information about ido from [here](http://www.emacswiki.org/emacs/InteractivelyDoThings)

Now let's install yasnippet.

1. `M-x`, select `list-packages`

2. On the list, `C-s` to find "yasnippet", you can find some plugin like "yasnippet yet another snippet extension for emacs". Enter `enter` to open it, then on the openned page you can see `Install` on the top, move your cursor to there and press `enter` to install it.

3. Now you have to add some config into ~/.emacs.d/lisp/init-local.el, if it's not exist please create a new one like below:

{% highlight lisp %}
(add-to-list 'load-path
"~/.emacs.d/elpa/yasnippet-20151108.1505/snippets/"         ;; the default collection
)
(require 'yasnippet)
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(provide 'init-local)

{% endhighlight %}

4. restart your emacs, and open any markdown file with extension '.md', you can enter `highlight` and then press `Tab`, you can see snippet works!!!

