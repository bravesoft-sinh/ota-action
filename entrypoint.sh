#!/bin/sh -l

set -e

if [ -z "$HOST_NAME" ] && [ -z "$SSH_KEY" ] && [ -z "$USER" ]; then
  echo "Can not ssh to your OTA server"
  exit 126
fi

echo "$SSH_KEY" >ota.pem
chmod 600 ota.pem
if [ -z "$PROJECT_NAME" ] ; then
  echo "Please set your project server"
  exit 126
fi

scp -i ota.pem -R dist/* $USER@$HOST_NAME:/var/www/html/$PROJECT_NAME/