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
echo "WAIT_ON_TIMEOUT=600000" >> .env

yarn ci

STATUS=$?

echo "Job Status: ${STATUS}"
echo "::set-output name=status::$STATUS"