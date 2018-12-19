#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add --all
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/ampersarnie/travis-test.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages develop-build
}

yarn && yarn build

setup_git
commit_files
upload_files
