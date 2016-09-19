import React from 'react';
import { Provider } from 'react-redux';
import SearchContainer from './search_container.js';
import BenchIndex from './bench_index';

const Root = ({store}) => (
  <Provider store={store}>
    <div>
      <SearchContainer />
    </div>
  </Provider>
);

export default Root;
