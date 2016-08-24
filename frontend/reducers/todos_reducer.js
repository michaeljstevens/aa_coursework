import {TODO_CONSTANT, requestTodos, recieveTodos, receiveTodo, createTodo} from '../actions/todo_actions';

import {merge} from 'lodash';

const TodosReducer = (state = {}, action) => {
  switch (action.type) {
    case TODO_CONSTANT.RECEIVE_TODOS:
      return merge({}, state, action.todos);
    case TODO_CONSTANT.RECEIVE_TODO:
      let newId = action.todo.id;
      let newObj = action.todo;
      return merge({}, state, {newId: newObj});
    default:
      return state;
  }
};

export default TodosReducer;
