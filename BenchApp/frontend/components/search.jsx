import React from 'react';
import BenchMap from './bench_map.jsx';
import BenchIndex from './bench_index.jsx';

const Search = ({benches, requestBenches, updateBounds}) => {
  return (<div>
    <BenchMap benches={benches} updateBounds={updateBounds} />
    <BenchIndex benches={benches} updateBounds={updateBounds} />
  </div>);
};

export default Search;
