#!/bin/bash
# Usage:
# ./deploy.sh 'Commit message'

echo -e "Deploying updates to GitHub..."
# Blow away docs folder and rebuild
rm -R docs
hugo
# Commit content changes to git and push.
git add -A
echo "Commit message: $1"
git commit -m "$1"
git push origin master
