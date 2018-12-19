#!/usr/bin/env sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add --all
  git add -f style.css
  git add -f bundle.js
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/ampersarnie/travis-test.git
  git show-ref
  git push origin-pages HEAD:develop-build --force
}

yarn && yarn build

setup_git
commit_files
upload_files
