import {TODO_CONSTANT, requestTodos, recieveTodos, receiveTodo} from '../actions/todo_actions';
import {createTodo, fetchTodos} from '../util/todo_app_util';


const TodoMiddleware = (store) => (next) => (action) => {
  switch (action.type) {
    case TODO_CONSTANT.REQUEST_TODOS:
      let success = data => store.dispatch(recieveTodos(data));
      fetchTodos(success);
      break;
    case TODO_CONSTANT.CREATE_TODO:
      let success1 = data => store.dispatch(receiveTodo(data));
      createTodo(action.todo, success1);
      break;
    default:
      return next(action);
  }
};

export default TodoMiddleware;
