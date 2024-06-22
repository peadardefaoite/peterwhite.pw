# README

This repo contains the Hugo config used to generate my [personal site](https://peterwhite.pw/). `deploy.sh` will run Hugo and push the changes up to GitHub. GitHub automatically picks up the changes and rebuilds my site. GitHub has been set to publish from the `docs` folder in this repo.

Commands to remember how to generate new content for my site
```
hugo new post/name-of-post.md
# Edit content of name-of-post.md and add related content
./deploy.sh 'Commit message'
```