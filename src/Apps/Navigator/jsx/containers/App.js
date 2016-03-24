import React, {
  Navigator
} from "react-native";

import FirstComponent from '../components/First'

class SampleComponent extends React.Component{

  render(){

    let defaultName = "FirstPageComponent";
    let defaultComponent = FirstComponent;

    return(
      <Navigator

        initialRoute = {{
          name: defaultName,
          component: defaultComponent
        }}

        configureScene={()=>{
          return Navigator.SceneConfigs.HorizontalSwipeJump;
        }}

        renderScene = {(router,navigator) => {
          var Component = router.component;
          if(router.component){
            return (
              <Component {...router.params} navigator={navigator} >
              </Component>);
          }
        }}
      >
      </Navigator>
    );
  }
}

export default SampleComponent;
