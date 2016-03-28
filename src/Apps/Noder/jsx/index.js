import React,{
	Component
} from 'react-native';
import { Provider } from '../../../libs/react-redux/index';
import configureStore from './store/configureStore';
import Navigation from './layouts/Navigation';


const store = configureStore();


class App extends Component {
	render() {
		return (
			<Provider store={store}>
				<Navigation/>
			</Provider>
		);
	}
}


export default App;
