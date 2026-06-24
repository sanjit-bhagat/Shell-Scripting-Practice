#!/bin/bash

BACKUP_DIR="backup"
DEPLOY_DIR="deployment"

LATEST_BACKUP=$(ls -td $BACKUP_DIR/* | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "No Backup Found"
    exit 1
fi

echo "Latest Backup Found:"
echo "$LATEST_BACKUP"

rm -rf $DEPLOY_DIR/*

cp -r $LATEST_BACKUP/* $DEPLOY_DIR/

if [ -f "$DEPLOY_DIR/app.py" ]; then
    echo "Rollback Successful"
else
    echo "Rollback Failed"
fi
