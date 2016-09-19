import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import {BenchConstants, requestBenches, receiveBenches} from './actions/bench_actions.js';
import {fetchBenches} from './util/bench_api_util.js';
import BenchIndexContainer from './components/bench_index_container.js';


document.addEventListener("DOMContentLoaded", () => {
  window.requestBenches = requestBenches;
  window.fetchBenches = fetchBenches;
  const store = window.store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
