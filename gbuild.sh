#!/usr/bin/env bash

export CLIENTPROJROOT=./src/main/frontend
export CLIENTPROJNAME=frontend


function build_frontend() {
    pushd ${CLIENTPROJROOT}
    npm run $1
    popd
    rm -rf src/main/resources/static && mkdir -p src/main/resources/static
    cp -r ${CLIENTPROJROOT}/dist/${CLIENTPROJNAME}/* src/main/resources/static
    #build_backend
}



if [ -d "${CLIENTPROJROOT}" ]; then
    build_frontend build
else
    echo "${CLIENTPROJROOT} does not exist"
    exit 1
fi
