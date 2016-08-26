import React from 'react';
import BenchIndexItem from './bench_index_item.jsx';

class BenchIndex extends React.Component {

  componentDidMount () {
    this.props.requestBenches();
  }

  render() {
    let keys = Object.keys(this.props.benches);
    const benchLis = keys.map( (key) => {
      return <BenchIndexItem bench={this.props.benches[key]} key={key}/>;
    });

    return(
      <ul>
        {benchLis}
      </ul>
    );
  }
}

export default BenchIndex;
