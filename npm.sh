#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
# npmRegistry='https://registry.npm.taobao.org'
npmRegistry='http://localhost:5080'
npmInstall="npm i --registry=${npmRegistry} --cache-min Infinity"

function cleanRn {
  dirNames=(
    $cwd/android
    $cwd/ios/
    $cwd/.flowconfig
    $cwd/.watchmanconfig
  )
  for dirName in "${dirNames[@]}"
  do
    rm -rf $dirName
  done
}

function cleanPrj {
  dirNames=(
    $cwd/npm-debug.log*
    $cwd/build
    $cwd/.tmp
    $cwd/dist
    $cwd/dest
  )
  for dirName in "${dirNames[@]}"
  do
    rm -rf $dirName
  done
}

function install {
  $npmInstall
  rm -rf $cwd/node_modules/lodash-*
  rm -rf $cwd/node_modules/lodash.*
  $npmInstall lodash.template
}

function reinstall {
  rm -rf $cwd/node_modules
  install
}

function gulpF {
  cleanPrj
  gulp
}

function start {
  npm cache clean
  node $cwd/node_modules/react-native/local-cli/cli.js start
}

function updateCheck {
  env NPM_CHECK_INSTALLER=npm npm-check -su
}

function updateSub {
  git submodule foreach --recursive git reset --hard
  git submodule foreach --recursive git clean -fd
  git submodule foreach git pull origin master
}

function link {
  for pkg in ${pkgs=
    react-native-vector-icons
    react-native-barcodescanner
    react-native-camera
    react-native-vibration
    react-native-blur
  }
  do
    # echo $pkg
    rnpm link $pkg
  done
}

function watchman {
  watchman watch-del $cwd
  watchman watch-project $cwd
}

function aliasNpn {
  echo "alias npm='npm --registry="${npmRegistry}"'"
}

function helper {
  echo 'Usage: ./npm.sh COMMAND'
  echo '       ./npm.sh [ h | -h | help | --help ]'
  echo ''
  echo 'Bash scripts for npm run tasks.'
  echo ''
  echo 'Commands:'
  echo '  clean:rn:       clean dirctorys about react-native'
  echo '  clean:prj:      clean dirctorys without push to git'
  echo '  install:        install require packages'
  echo '  reinstall:      reinstall require packages'
  echo '  gulp:           run default gulp task'
  echo '  start:          start dev server of RN'
  echo '  update:check:   check local pkgs version'
  echo '  update:sub:     update all of the submodule'
  echo '  link:           run rnpm link commands'
  echo '  watchman:       rewatch use watchman command'
  echo '  alias:npm:      echo alias npm use cnpm registry'
}

function main {
  case $1 in

    h | '-h' | help | '--help' )
      helper
      echo 'hello'
      ;;

    clean:rn )
      cleanRn
      ;;

    clean:prj )
      cleanPrj
      ;;

    install )
      install
      ;;

    reinstall )
      reinstall
      ;;

    gulp )
      gulpF
      ;;

    start )
      start
      ;;

    update:check )
      updateCheck
      ;;

    link )
      link
      ;;

    watchman )
      watchman
      ;;

    alias:npm )
      aliasNpn
      ;;

    * )
      helper
      ;;
  esac
}

main $@
# cleanRn
