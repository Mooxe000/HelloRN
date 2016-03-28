{ assign } = Object
{
  cfx
  cfxify
  Styl
} = require '../../../../common/cfx'
{ Platform } = require 'react-native'

Router = cfxify (
  require 'react-native-simple-router'
).default
# Page = (
#   require '../../jsx/containers/Page'
# ).default
Page = require './Page'

styles = Styl
  header:
    backgroundColor: '#3b5999'

firstRoute =
  name: 'Explorer'
  component: Page

RouterConf =
  firstRoute: firstRoute
  headerStyle: styles.header
  ref: { 'router' }

if Platform.OS is 'android'
  RouterConf = assign {}
  , RouterConf
  , handleBackAndroid: true


Explorer = -> Router RouterConf
module.exports = cfx Explorer
