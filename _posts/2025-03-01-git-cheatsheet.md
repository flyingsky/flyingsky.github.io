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

4. `git push --force`
   Once I commit my local changes, I use this to push it to remote. Before you have to set up the remote branch via `git push -u origin {branch}`.

5. `git log --oneline --graph --all`
    Show log in oneline. I don't use it too much because I prefer to use the UI tool from the VSCode extension.
   
7. `git cherry-pick`
   branch1 has commitA and commitB, move commitB to another branch2, we could use `git cherry-pick` like below.
   ```
    git checkout branch1  
    git log --oneline  
    git reset --hard <commitA_hash>  
    git checkout -b branch2  
    git cherry-pick <commitB_hash>  
    git log --oneline --graph --all  
    git push origin branch1 --force  
    git push origin branch2  
   ```

8. Break large commit to small ones
   My branch1 has large commitA, now I try to break it into commitB and commitC.
   ```
    git checkout branch1  
    git reset --soft HEAD~1  # Undo commitA but keep changes staged  
    git reset HEAD  # Unstage changes so you can commit them separately  
    git add <file1>  # Stage part of the changes for commitB  
    git commit -m "commitB"  # Create commitB  
    git add <file2>  # Stage the rest of the changes for commitC  
    git commit -m "commitC"  # Create commitC  
    git log --oneline --graph --all  # Verify commit history  
    git push --force origin branch1  # Force push to update remote branch  
   ```
   
Once the code is finished in local, create a pull request in the VSCode directly. Every time you change the local code and push it to the remote, the pull request is automatically updated in the Github for reviewing.

I create a new branch for every task. If one big task has task1 and task2, I will have branch1 based on main for task1, then create branch2 based on branch1 for task2. If the task1 is done, I will merge it back to main. Then rebase branch2 to main head to avoid many conflicts if branch2 has too many commits behind main. I rebase branch often to make sure my branch doesn't have many conflicts with the main.
