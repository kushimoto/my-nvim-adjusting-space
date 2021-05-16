#!/bin/bash

cat <<EOF > .env
APP_NAME=${PWD##*/}
EOF

echo ;

echo "Please execute the following command.";

echo "$ (sudo) docker-compose up -d\n";
