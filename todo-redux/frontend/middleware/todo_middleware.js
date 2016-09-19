import {TODO_CONSTANT, requestTodos, recieveTodos, receiveTodo, removeTodo, toggleTodo} from '../actions/todo_actions';
import {createTodo, updateTodo, destroyTodo, fetchTodos} from '../util/todo_app_util';


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
    case TODO_CONSTANT.UPDATE_TODO:
      let success2 = data => store.dispatch(receiveTodo(data));
      updateTodo(action.todo, success2);
      break;
    case TODO_CONSTANT.DESTROY_TODO:
      let success3 = data => store.dispatch(removeTodo(data));
      destroyTodo(action.todo, success3);
      break;
    default:
      return next(action);
  }
};

export default TodoMiddleware;
