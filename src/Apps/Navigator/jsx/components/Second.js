import React, {
  View,
  Text,
  TouchableOpacity,
} from "react-native";

class SecondPageComponent extends React.Component {

  USER_MODELS = {
    1: {
      name: '小明',
      age: 23
    }
  };

  _pressButton() {
    const { navigator } = this.props;

    if(this.props.getUser) {
      let user = this.USER_MODELS[this.props.id];
      this.props.getUser(user);
    }

    if(navigator)
      navigator.pop();
  }

  componentDidMount() {
    this.setState({
      id: this.props.id
    })
  };

  render(){

    return (
      <View style={{
        'backgroundColor': '#f9f9f9',
        'flex': 1
      }}>
        <Text>SecondPageComponent</Text>
        <TouchableOpacity onPress={this._pressButton.bind(this)}>
          <Text>返回</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

export default SecondPageComponent;
