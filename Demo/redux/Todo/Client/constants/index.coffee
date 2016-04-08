{
  toActionsTypes
  crudActionsTypes
  mergeActionsTypes
} = require '../../../../../src/common/reduxHelper'

Todo =
  Entry: toActionsTypes {
    'LOAD_TODO'
    'ADD_TODO'
    'MODIFY_TODO'
    'REMOVE_TODO'

  }
  ToBE: mergeActionsTypes(
    toActionsTypes {
      'FETCH_TODO'
      'CREATE_TODO'
      'UPDATE_TODO'
      'DELETE_TODO'
    }
    crudActionsTypes 'todo'
  )

  State: toActionsTypes {
    'LOAD_TODO_STATE'
    'ADD_TODO_STATE'
    'MODIFY_TODO_STATE'
    'REMOVE_TODO_STATE'
    'SET_VISIBILITY_FILTER'
  }
  Filter: {
    'SHOW_ALL_TODO'
    'SHOW_COMPLETED_TODO'
    'SHOW_ACTIVE_TODO'
  }

module.exports = Todo
