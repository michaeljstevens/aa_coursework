import {requestBenches} from '../actions/bench_actions.js';
import {connect} from 'react-redux';
import BenchIndex from './bench_index.jsx';
import Search from './search.jsx';


const mapStateToProps = state => {
  return ({benches: state.benches});
};

const mapDispatchToProps = dispatch => {
  return ({requestBenches: ()=> dispatch(requestBenches())});
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
