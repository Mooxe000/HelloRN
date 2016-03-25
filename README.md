# HelloRN

React Native Hello World with coffee-script as source language.

## Started

```bash
git clone https://github.com/Mooxe000/HelloRN.git

cd HelloRN

yes | react-native upgrade; git checkout -- .gitignore

# bash
echo "alias rn-upgrade='yes | react-native android && yes | react-native upgrade && git checkout -- .gitignore && git checkout -- index.android.js'" >> ~/.bashrc
# fish
echo "alias rn-upgrade 'yes | react-native android; yes | react-native upgrade; git checkout -- .gitignore; git checkout -- index.android.js'" >> ~/.config/fish/config.fish

rn-upgrade

npm start --reset-cache

gulp

simlator && react-native run-ios
react-native run-android
```

### TODO

* [react-native-simple-router](https://github.com/react-native-simple-router-community/react-native-simple-router)
* [react-native-gifted-listview](https://github.com/FaridSafi/react-native-gifted-listview)
