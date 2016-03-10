# HelloRN

React Native Hello World with coffee-script as source language.

## Started

```bash
git clone https://github.com/Mooxe000/HelloRN.git

cd HelloRN

yes | react-native upgrade; git checkout -- .gitignore

# bash
echo "alias rn-upgrade='yes | react-native upgrade && git checkout -- .gitignore'" >> ~/.bashrc
# fish
echo "alias rn-upgrade 'yes | react-native upgrade; git checkout -- .gitignore'" >> ~/.config/fish/config.fish

rn-upgrade

npm start --reset-cache

gulp

simlator && react-native run-ios
react-native run-android
```
