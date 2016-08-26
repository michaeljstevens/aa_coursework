import React from 'react';
import { Provider } from 'react-redux';
import BenchIndexContainer from './bench_index_container.js';
import BenchIndex from './bench_index';

const Root = ({store}) => (
  <Provider store={store}>
    <div>
      <BenchIndexContainer />
    </div>
  </Provider>
);

export default Root;
