#!/bin/bash

export DEB_NAME=$(find ./ -name "*.deb")

echo "Deploying package: ${DEB_NAME}"
curl -F package=@${DEB_NAME} https://${FURYGEM_TOKEN}@push.fury.io/${FURYGEM_NAME}