import React from 'react';
import ReactDOM from 'react-dom';
import * as API from './util/api_util';
import * as ACTIONS from './actions/pokemon_actions.js';
import configureStore from './store/store.js';
import Root from './components/root.jsx';

document.addEventListener('DOMContentLoaded', ()=>{
  const root = document.getElementById('root');
  let store = configureStore();
  window.store = store;
  // console.log(store.getState());
  // let success = (data) => store.dispatch(ACTIONS.receiveAllPokemon(data));
  // API.fetchAllPokemon(success);


  ReactDOM.render(<Root store={store} />, root);
});
