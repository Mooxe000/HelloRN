/**
 *
 * User: sherlock
 * Date: 16/1/24
 * Time: 下午3:53
 * 导航使用练习 基于react-native 0.18.1
 */

import React,{View,Navigator,Text,TouchableOpacity,StyleSheet} from "react-native";


class SampleComponent extends  React.Component{


    render(){

        let defaultName = "FirstPageComponent";
        let defaultComponent = FirstComponent;

        return(
            <Navigator
                initialRoute = {{name : defaultName,component : defaultComponent}}
                configureScene={()=>{
                    return Navigator.SceneConfigs.HorizontalSwipeJump;
                }}
                renderScene = {(router,navigator) => {
                    var Component = router.component;
                    if(router.component){
                        return (<Component {...router.params} navigator={navigator} ></Component>);
                    }
                } }
            >
            </Navigator>

        );


    }



}

class  SecondPageComponent extends React.Component{

    USER_MODELS = {
        1: { name: '小明', age: 23 }
    };


    _pressButton(){
        const { navigator } = this.props;

        if(this.props.getUser){
            let user = this.USER_MODELS[this.props.id];
            this.props.getUser(user);
        }

        if(navigator)
            navigator.pop();
    }

    componentDidMount(){
        this.setState({
            id : this.props.id
        })

    };

    render(){
        return (
            <View style={{'backgroundColor':"#f9f9f9",'flex' : 1}}>
                <Text>SecondPageComponent</Text>
                <TouchableOpacity onPress={this._pressButton.bind(this)}>
                    <Text>返回</Text>
                </TouchableOpacity>
            </View>
        );
    }
}

class  FirstComponent extends  React.Component{

    state = {
        id  :1,
        user : null
    };


    construct(){

    };


    _pressButton(){
        let _this = this;
        const {navigator} = this.props;
        if(navigator)
            navigator.push({
                name : "SecondPageComponent",
                component : SecondPageComponent,
                params : {
                    id : this.state.id,
                    //获得返回值
                    getUser : function(user){
                        _this.setState({user :user});
                    }
                }
            })
    };

    render(){

        if(this.state.user){
            return (<View><Text>用户信息: {JSON.stringify(this.state.user)}</Text></View>);
        }
        else{
            return (
                <View style={{'backgroundColor':"#c7c7c7",'flex' : 1}}>
                    <Text>FirstComponent</Text>
                    <TouchableOpacity onPress={this._pressButton.bind(this)}>
                        <Text>点我查询用户id={this.state.id}</Text>
                    </TouchableOpacity>

                </View>
            );
        }



    }
}



export default SampleComponent;
