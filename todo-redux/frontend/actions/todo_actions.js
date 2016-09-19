export const TODO_CONSTANT = {
  REQUEST_TODOS: "REQUEST_TODOS",
  RECEIVE_TODOS: "RECEIVE_TODOS",
  CREATE_TODO: 'CREATE_TODO',
  RECEIVE_TODO: 'RECEIVE_TODO',
  TOGGLE_TODO: 'TOGGLE_TODO',
  DESTROY_TODO: 'DESTROY_TODO',
  REMOVE_TODO: 'REMOVE_TODO',
  UPDATE_TODO: 'UPDATE_TODO'
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

export const toggleTodo = todo => ({
  type: TODO_CONSTANT.TOGGLE_TODO,
  todo
});

export const updateTodo = todo => ({
  type: TODO_CONSTANT.UPDATE_TODO,
  todo
});

export const destroyTodo = todo => ({
  type: TODO_CONSTANT.DESTROY_TODO,
  todo
});

export const removeTodo = todo => ({
  type: TODO_CONSTANT.REMOVE_TODO,
  todo
});
