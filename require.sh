#!/usr/bin/env bash

cnpm install --save \
  react-native \
  redux \
  redux-thunk \
  redux-logger \
  redux-actions \
  react-native-simple-router \
  react-native-gifted-listview \
  react-native-gifted-spinner \
  react-native-vector-icons \
  react-native-vibration \
  react-native-button \
  react-native-scrollable-tab-view \
  react-native-html-render \
  react-native-blur \
  react-native-barcodescanner@https://github.com/ideacreation/react-native-barcodescanner.git \
  react-native-camera@https://github.com/lwansbrough/react-native-camera.git \
  randomcolor \
  flux-standard-action \
  query-string \
  moment \
  markdown \
  util

cnpm install --save-dev \
  coffee-script \
  ddeyes \
  shelljs \
  lodash \
  build-module-task \
  gulp \
  gulp-util \
  gulp-coffee \
  run-sequence \
  hoist-non-react-statics \
  invariant \
  gulp-babel \
  babel-preset-es2015 \
  babel-preset-stage-0 \
  babel-preset-stage-2 \
  babel-preset-react
  # bluebird
  # bignumber.js

rnpm install \
  react-native-barcodescanner@https://github.com/ideacreation/react-native-barcodescanner.git \
&& \
rnpm install \
  react-native-camera@https://github.com/lwansbrough/react-native-camera.git

rn-upgrade && \
mkdir -p ./ios/Resources && \
rnpm link react-native-vector-icons && \
rnpm link react-native-barcodescanner && \
rnpm link react-native-camera && \
rnpm link react-native-vibration && \
rnpm link react-native-blur
