import React, {
  View,
  Text,
  TouchableOpacity,
} from "react-native";

import SecondPageComponent from './Second'

class FirstComponent extends  React.Component{

  state = {
    id  :1,
    user : null
  };

  construct(){};

  _pressButton(){
    let _this = this;
    const {navigator} = this.props;

    if(navigator)
      navigator.push({
        name: "SecondPageComponent",
        component: SecondPageComponent,
        params: {
          id: this.state.id,
          getUser: function(user){ //获得返回值
            _this.setState({user :user});
          }
        }
      })
  };

  render() {

    if(this.state.user){
      return (
        <View>
          <Text>用户信息: {JSON.stringify(this.state.user)}
          </Text>
        </View>
      );
    } else {
      return (
        <View style={{
          'backgroundColor': "#c7c7c7",
          'flex' : 1
        }}>
          <Text>FirstComponent</Text>
          <TouchableOpacity onPress={this._pressButton.bind(this)}>
            <Text>点我查询用户id={this.state.id}</Text>
          </TouchableOpacity>
        </View>
      );
    }
  }
}

export default FirstComponent;
