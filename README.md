# HelloRN

React Native Hello World with coffee-script as source language.

## Started

```bash
git clone https://github.com/Mooxe000/HelloRN.git

cd HelloRN

yes | react-native upgrade; git checkout -- .gitignore

# bash
echo "alias rn-upgrade=' \
  yes | react-native android && \
  yes | react-native upgrade && \
  git checkout -- .gitignore && \
  git checkout -- index.android.js && \
  mkdir -p ./ios/Resources'" >> ~/.bashrc
# fish
echo "alias rn-upgrade '\
  yes | react-native android; \
  yes | react-native upgrade; \
  git checkout -- .gitignore; \
  git checkout -- index.android.js \
  mkdir -p ./ios/Resources'" >> ~/.config/fish/config.fish

rn-upgrade

npm start --reset-cache

gulp

simlator && react-native run-ios
react-native run-android
```

## react-native-vector-icons

### ios

Edit ./ios/HelloRN/Info.plist and Add these lines

```xml
<key>UIAppFonts</key>
  <array>
    <string>Entypo.ttf</string>
    <string>EvilIcons.ttf</string>
    <string>FontAwesome.ttf</string>
    <string>Foundation.ttf</string>
    <string>Ionicons.ttf</string>
    <string>MaterialIcons.ttf</string>
    <string>Octicons.ttf</string>
    <string>Zocial.ttf</string>
</array>
```

### android

Edit ./android/app/build.gradle

After line
  apply from: "react.gradle"
Add this line
  apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"

## rnpm link

```bash
rnpm link react-native-vector-icons
rnpm link react-native-barcodescanner
rnpm link react-native-camera
rnpm link react-native-vibration
rnpm link react-native-blur
```
