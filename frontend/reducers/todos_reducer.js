import {TODO_CONSTANT, requestTodos, recieveTodos, receiveTodo, createTodo, removeTodo} from '../actions/todo_actions';

import {merge} from 'lodash';

const TodosReducer = (state = {}, action) => {
  switch (action.type) {
    case TODO_CONSTANT.RECEIVE_TODOS:
      let todoss = {};
      action.todos.forEach(todo => (todoss[todo.id] = todo));
      return merge({}, state, todoss);
    case TODO_CONSTANT.RECEIVE_TODO:
      let newId = action.todo.id;
      let newObj = merge({}, state);
      let aT = action.todo;
      newObj[action.todo.id] = action.todo;
      return newObj;
    case TODO_CONSTANT.REMOVE_TODO:
      let newObj2 = merge({}, state);
      return deletor(newObj2, action.todo.id);
    case TODO_CONSTANT.TOGGLE_TODO:
      let newOjb3 = merge({}, state);
      return updator(newOjb3, action.todo.id);
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

const updator = (state, id) => {
  for (let key in state) {
    if(state[key].id === id) {
      state[key].done = !state[key].done;
    }
  }
  return state;
};



export default TodosReducer;
