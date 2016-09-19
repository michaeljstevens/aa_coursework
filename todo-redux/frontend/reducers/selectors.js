const allTodos = state => {
  const keys = Object.keys(state.todos);
  let keyedTodos = keys.map( key => {
    return state.todos[key];
  });
  return keyedTodos;
};

export default allTodos;
