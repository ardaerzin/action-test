#!/bin/sh -l

echo "clone {$1}"
git clone $1 test-folder

cd test-folder

git checkout $2

yarn

cd ${3}

touch .env
echo "NEXT_PUBLIC_API_URL=${4}" >> .env
echo "NEXT_PUBLIC_CALENDLY_LINK=${5}" >> .env
echo "NEXT_PUBLIC_ORTHO_CALENDLY_LINK=${6}" >> .env

yarn dev | yarn cypress:run --browser chrome

STATUS=$?
echo "Status: ${STATUS}"
echo "::set-output name=status::$STATUS"