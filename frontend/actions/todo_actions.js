export const TODO_CONSTANT = {
  REQUEST_TODOS: "REQUEST_TODOS",
  RECEIVE_TODOS: "RECEIVE_TODOS",
  CREATE_TODO: 'CREATE_TODO',
  RECEIVE_TODO: 'RECEIVE_TODO'
};

export const requestTodos = () => ({
  type: TODO_CONSTANT.REQUEST_TODOS
});

export const recieveTodos = todos => ({
  type: TODO_CONSTANT.RECEIVE_TODOS,
  todos
});

export const createTodo = todo => ({
  type: TODO_CONSTANT.CREATE_TODO,
  todo
});

export const receiveTodo = todo => ({
  type: TODO_CONSTANT.RECEIVE_TODO,
  todo
});
