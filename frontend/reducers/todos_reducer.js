import {TODO_CONSTANT, requestTodos, recieveTodos, receiveTodo, createTodo, removeTodo} from '../actions/todo_actions';

import {merge} from 'lodash';

const TodosReducer = (state = {}, action) => {
  switch (action.type) {
    case TODO_CONSTANT.RECEIVE_TODOS:
      return merge({}, state, action.todos);
    case TODO_CONSTANT.RECEIVE_TODO:
      let newId = action.todo.id;
      let newObj = merge({}, state);
      let aT = action.todo;
      newObj[action.todo.id] = action.todo;
      return newObj;
    case TODO_CONSTANT.REMOVE_TODO:
      let newObj2 = merge({}, state);
      return deletor(newObj2, action.todo.id);
    default:
      return state;
  }
};

const deletor = (state, id) => {
  for (let key in state) {
    if(state[key].id === id) {
      delete state[key];
    }
  }
  return state;
};


export default TodosReducer;
