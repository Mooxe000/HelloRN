#!/usr/bin/env bash

function install {
  npm i --registry=https://registry.npm.taobao.org
  rm -rf node_modules/lodash-*
  rm -rf node_modules/lodash.*
  npm i --registry=https://registry.npm.taobao.org lodash.template
}

install
