#!/bin/bash
# Usage:
# ./deploy.sh 'Commit message'

echo -e "Deploying updates to GitHub..."

# Add content changes to git.
git add -A

# Commit content changes.
echo "Commit message: $1"
git commit -m "$1"

# Push content source
git push origin master

# Switch to gh-pages
git checkout gh-pages

# Blow away docs folder
rm -R docs

# Build the project.
hugo

