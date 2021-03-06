import * as types from '../constants/ActionTypes';


const initialState = {
	loginModalVisible: false
};


export default function (state = initialState, action) {
	const { payload, error, meta, type } = action;

	switch (type) {
		case types.OPEN_LOGIN_MODAL:
		case types.CLOSE_LOGIN_MODAL:
			return {
				loginModalVisible: payload.show
			};
		default:
			return state;
	}
}
