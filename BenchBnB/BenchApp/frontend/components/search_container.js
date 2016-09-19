import {requestBenches} from '../actions/bench_actions.js';
import {connect} from 'react-redux';
import BenchIndex from './bench_index.jsx';
import Search from './search.jsx';
import {updateBounds} from '../actions/filter_actions.js';


const mapStateToProps = state => {
  return ({benches: state.benches});
};

const mapDispatchToProps = dispatch => ({
   updateBounds: (filter, value) => dispatch(updateBounds(filter, value))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
