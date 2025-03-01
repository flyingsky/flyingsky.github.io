---
layout: post
date: 2025-03-01 01:49:00 -0800
title: Git Cheatsheet
categories: home
---

Start to use Github for a side project in collobration environment, so I have to learn some workflow with git/github, which is different to the Google fig. Some people joining Google with Git experience doesn't like Google fig because they think some features are different. Actually I think Google fig is more straight forward and easier to understand. Here I want to have a git cheatsheet and compare them in the daily work.

### Daily Workflow

| Work Environment  | bug/task tool  | code editor             | code version control  | code review tool | integration workflow |
| ----------------  | -------------  | ------------            | -------------         | -------------    | -------------        |
| GitHub            | Github issues  | VSCode                  | git                   | Github           | Github workflow      |
| Google            | Bugnizer       | Cider-V based on VSCode | fig                   | Critique         | Sponge               |

The daily workflow is like below:

1. Get a task from the bug/task tool. Google has Bugnizer, which has old UI but powerful features. I like the hotlist, just like music playlist. Google also builds some agile tool based on the Bugnizer, but it's not as good as JIRA based on my experience.
2. Start coding in the editor. Google has browser-based editor, Cider-V based on VSCode, so you could use any computer/laptop to get the same experience. It integrates with version control, AI assistant and other great internal tools. See more details from my another blog, [Google Top Internal Dev Tools](https://flyingsky.github.io/2024/07/google-top-internal-dev-tools-1.html).
3. Version Control to manage the code.
4. Code review
5. Different workflow integration, like lint checking, unit test, integration test, etc.

### Git Cheatsheet

1. `git switch {branch}`
    Switch to the existing target branch. Add `-d` to create a new branch.

2. `git pull origin {branch}`
    Sync the current branch to the remote latest.

3. `git rebase {dest-branch}`
    You're at `src-branch` and you want to make the `src-branch` on top of the `dest-branch`. Git branch may have many commits and we want to merge them into one, we could use `git rebase -i HEAD~N`, the `N` is the top N commits to merge. Then you could select the first commit as `pick`, other commits `s` or `squash`, then select the right commit message for your merged commits. Unfortunately I don't see any 
UI tool supports this merge feature. In Google fig, you could use `hg fold`, `hg` is the fig command like git. The Cider-V provides the UI to make it very easy.
