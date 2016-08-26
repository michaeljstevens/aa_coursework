import React from 'react';
import BenchMap from './bench_map.jsx';
import BenchIndex from './bench_index.jsx';

const Search = ({benches, requestBenches}) => {
  return (<div>
    <BenchMap />
    <BenchIndex benches={benches} requestBenches={requestBenches}/>
  </div>);
};

export default Search;
