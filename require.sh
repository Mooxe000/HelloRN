#!/usr/bin/env bash

cnpm install --save \
  react-native \
  redux \
  redux-thunk \
  redux-saga \
  redux-logger \
  redux-actions \
  reduce-reducers \
  seamless-immutable \
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
  babel-preset-react \
  node-fetch
  # bluebird
  # bignumber.js

fish -lc 'rn-upgrade'
# && mkdir -p ./ios/Resources

# rnpm install \
#   react-native-vector-icons
# rnpm install \
#   react-native-barcodescanner
# rnpm install \
#   react-native-camera

cnpm i --save \
  react-native-vector-icons@https://github.com/oblador/react-native-vector-icons.git \
  react-native-barcodescanner@https://github.com/ideacreation/react-native-barcodescanner.git \
  react-native-camera@https://github.com/lwansbrough/react-native-camera.git \
  react-native-storage \
  react-native-simple-router \
  react-native-gifted-listview \
  react-native-gifted-spinner \
  react-native-vibration \
  react-native-button \
  react-native-scrollable-tab-view \
  react-native-html-render \
  react-native-blur

# Edit ./ios/HelloRN/Info.plist and Add these lines
# <key>UIAppFonts</key>
# <array>
#   <string>Entypo.ttf</string>
#   <string>EvilIcons.ttf</string>
#   <string>FontAwesome.ttf</string>
#   <string>Foundation.ttf</string>
#   <string>Ionicons.ttf</string>
#   <string>MaterialIcons.ttf</string>
#   <string>Octicons.ttf</string>
#   <string>Zocial.ttf</string>
# </array>

# Edit ./android/app/build.gradle
# After line
#   apply from: "react.gradle"
# Add this line
#   apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"

# rnpm link react-native-vector-icons
# rnpm link react-native-barcodescanner
# rnpm link react-native-camera
# rnpm link react-native-vibration
# rnpm link react-native-blur

npm run link
npm run link
