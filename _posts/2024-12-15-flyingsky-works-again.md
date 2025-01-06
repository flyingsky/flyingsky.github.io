---
layout: post
date: 2024-12-15 02:11:00 -0800
title: FlyingSky Blog Works again
categories: home
---

I decided to update my flyingsky github.io to support multiple categories except the existing post, so I could write different topics, such as some personal life thoughts in Chinese, my native language. I find the jekyll-paginate-v2 has a good category example. Once I copy the it's example to update my site, this website, https://flyingsky.github.io, is down. After trying several times to fix it without local setup, the problem is still there. Because it's down for several weeks, I lost 0.02 cents from Google Adsense. To earn that back, I decided to save this site.

### Set up local environment

I didn't change the setup for a long time since the [first setup in 2014](https://flyingsky.github.io/2014/09/steps-to-setup-blog-with-jekyll.html). That's why I even forget how to start. After some investigation, I noticed I have to install the Ruby first and it's better to use ruby management tool like rvm. It's easy to instll rvm, but it always has problem to install ruby 3.x like some native library build failures, even it's success to install ruby, the jekyll could not install successfully. Ask the help from Gemini and Chatgpt, both could not provide real workable solution. When I was exploring in the darkness, I noticed maybe I should highlight the installation on Mac. Asking [Gemini 2 from the Google AI Studio](https://aistudio.google.com/), it provides below answer to recommend `rbenv` and `asdf` instead. It's very easy to install ruby and jekyll.

![Gemini 2 Answer](/assets/2024-12-15.png){:width="50%"}

To use `rbenv`, just run below commands:

```
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install rbenv
brew install rbenv ruby-build

# set the rbenv in your .zshrc. Just google or ask gemini for other shell.
echo 'if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi' >> ~/.zshrc
source ~/.zshrc

# install ruby 3.3.6 and use it in global
rbenv install 3.3.6
rbenv global 3.3.6

# install jekyll and the project dependency manager bundle.
gem install jekyll bundle

# go to the git io project and start jekyll in local
cd {my_flyingsky_project}
bundle install
jekyll serve
```

Once the jekyll is running in my local, I noticed the old pagination doesn't work well, because now I use [jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2). It's not hard to fix it, see my commit from https://github.com/flyingsky/flyingsky.github.io/commit/8f9694dc765e86b3ca51fd8dbb20bc8f7915ed36. If you clone my project to build your own blog, you should not worry about this. 

### Set new workflow

Once I submit all changes to the github, the home page is empty. Check the repository Action tab, it shows some build warning like below:

> The github-pages gem can't satisfy your Gemfile's dependencies. If you want to use a different Jekyll version or need additional dependencies, consider building Jekyll site with GitHub Actions: https://jekyllrb.com/docs/continuous-integration/github-actions/

Open the link, it mentions I change the jekyll version to 4.x and use unsupported plugin like jekyll-paginate-v2. To resolve that issue, I have to use github customized workflow follwing https://jekyllrb.com/docs/continuous-integration/github-actions/#setting-up-the-action.

Once you set up that, everything works well again. Finally I could earn 0.02$ per quarter from Google Adsense.

### Pagination for different categories

All the default posts are listed in the [index.md](https://github.com/flyingsky/flyingsky.github.io/blob/master/index.md) and the extra chinese category posts are listed by [chinese.md](https://github.com/flyingsky/flyingsky.github.io/blob/master/categories/chinese.md).

In the beginning, the https://flyingsky.github.io/chinese url doesn't work, because by default it's another url like `category/chinese`, I have to add the `permalink: /chinese/` in the front matter to the chinese.md to use the expected url. To avoid the chinese category posts are listed in the home page, I have to add the `home` category to all the old posts and add the category filter into the front matter of home [index.md](https://github.com/flyingsky/flyingsky.github.io/blob/master/index.md) to make sure it only paginate the home category posts.

Another tricky thing is the posts under [chinese/_posts](https://github.com/flyingsky/flyingsky.github.io/tree/master/chinese/_posts) are not generated because I don't add the `YYYY-MM-DD` prefix into the post file name. That's a silly issue, at least Jekyll should show some error or warning to remind the user.
