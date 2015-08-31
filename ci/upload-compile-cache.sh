#!/bin/bash

zip -3 -r "/tmp/compilecache.zip" "/tmp/JSIL Tests/*"

if curl -S -X POST "jsil.org/ci/upload.aspx?key=travisci&tag=$JSIL_STORAGE_TAG&password=$JSIL_STORAGE_PASSWORD" --data-binary "@/tmp/compilecache.zip"; then
    echo "Failed to upload compile cache."
else
    echo "Uploaded compile cache."
fi