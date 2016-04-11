{
  toActionsTypes
  crudActionsTypes
  mergeActionsTypes
} = require '../../../../../src/common/reduxHelper'

Todo = mergeActionsTypes
  Entry: toActionsTypes {
    'LOAD_TODO'
    'ADD_TODO'
    'MODIFY_TODO'
    'REMOVE_TODO'
  }
  Fetch: crudActionsTypes 'todo'
  State: toActionsTypes {
    'LOAD_TODO_STATE'
    'ADD_TODO_STATE'
    'MODIFY_TODO_STATE'
    'REMOVE_TODO_STATE'
    'SET_VISIBILITY_FILTER'
  }
  visibilityFilter:
    types: {
      'SHOW_ALL_TODO'
      'SHOW_COMPLETED_TODO'
      'SHOW_ACTIVE_TODO'
    }

module.exports = {
  Todo
}
