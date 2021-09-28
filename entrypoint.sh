#!/bin/sh -l

echo "clone {$1}"
git clone $1 test-folder

cd test-folder

git checkout $2

yarn

cd apps/lucy

yarn dev | yarn cypress:run --browser chrome

time=$(date)
echo "::set-output name=time::$time"