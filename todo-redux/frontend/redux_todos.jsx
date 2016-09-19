import React from 'react';
import ReactDOM from 'react-dom';
import fetchTodos from './util/todo_app_util';
import configureStore from './store/store';
import allTodos from './reducers/selectors.js';
import {TODO_CONSTANT, requestTodos, recieveTodos, createTodo} from './actions/todo_actions';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  window.createTodo = createTodo;
  window.requestTodos = requestTodos;
  const store = configureStore();
  window.store = store;
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
