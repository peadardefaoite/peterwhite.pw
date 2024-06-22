---
title: "The Joys Of Setting Up A Site"
date: 2017-08-04T00:33:36+01:00
tags: ["hugo", "github pages", "git"]
draft: false
---

#### Update (02-07-2018): So it seems like the docs have been updated and a new way of publishing GitHub Pages through a /docs/ folder is available. I've gone with this approach instead, which puts the Hugo config and published content in the same repo, which may not be ideal, but hey, it's better than what I had before.

New site, new technology to generate it, what could go wrong?! As it turns out, quite a bit.

I'm using [Hugo](https://gohugo.io) to generate this site, and one thing I noticed from 
the [docs on hosting on GitHub](https://gohugo.io/hosting-and-deployment/hosting-on-github/) is that they don't mention a way to store 
the Hugo config code. Only the generated site gets pushed to GitHub using a git `submodule` 
for the generated code. In the event of my computer crashing, I'd have to start from 
scratch on rebuilding my website.

One approach I thought of to save off my Hugo config was to store it on a different 
branch on the `defaoite4.github.io` repo, run Hugo with a new post or edits, switch 
back to master, commit the contents of the untracked `public` folder and push. Hint: 
it didn't work. I'm sure I was doing something wrong since my commits were being rejected from GitHub.

---
```shell
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:defaoite4/defaoite4.github.io.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
---
I imagine that this was due to pushing the config branch to GitHub first, then 
committing the `public` submodule afterwards. Anyway, the repo got into a weird state, 
so I followed the [xkcd approach](https://xkcd.com/1597/).

Next attempt was to use `git submodule` for the `public` generated site to push that
to `defaoite4.github.io` and have this contained inside a new repo, `site-hugo-config` 
that would be pushed to a different location. I'm not that familiar with git submodules, 
but it proved a bit too difficult to learn at 11pm on a Thursday night. One thing I did 
note is that git doesn't seem to like it when you add a submodule using SSH. It adds the 
submodule, but then doing a `git status` results in a weird error.

---
```shell
$ git status
fatal: Could not chdir to '../../../defaoite4.github.io': No such file or direct
fatal: 'git status --porcelain=2' failed in submodule public
```
---

Attempt #2 failed, let's hope #3 succeeds! Abandoning the idea of submodules, I just 
decided to go with having two separate repos, one with the config that will generate 
the site, which will then be copied to the other repo, committed and pushed. Using a 
very short [shell script](https://github.com/defaoite4/peterwhite.pw/blob/master/deploy.sh), 
I managed to succeed at having a relatively easy path to updating my website. All I need to 
do is use Hugo to add new content and run the deploy script. Both repos get updated with the 
new content, and GitHub automatically publishes the content to my website.

Now, having two repos for basically the same content is ~~probably~~ definitely redundant, 
but it's easier than the earlier options I tried out.