import React from 'react';


const TodoListItem = ({todo, updateTodo, destroyTodo}) => (
  <li>
    {todo.title}
    <button onClick={updateTodo.bind(null, todo)}>Update</button>
    <button onClick={destroyTodo.bind(null, todo)}>Remove</button>
  </li>
);

export default TodoListItem;
