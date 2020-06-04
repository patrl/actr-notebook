#!/usr/bin/env bash

git stash
git checkout master
jupyter nb-convert Chapter\ 2.ipynb --to slides
git fetch --all
git checkout -b gh-pages --track origin/gh-pages
rm index.html
mv Chapter\ 2.slides.html index.html
git add -A
git commit -m \"Publish.\"
git push origin gh-pages:gh-pages
git checkout master
git branch -D gh-pages
git stash pop
