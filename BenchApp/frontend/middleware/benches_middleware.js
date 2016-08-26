import { BenchConstants, receiveBenches } from '../actions/bench_actions.js';
import { fetchBenches } from '../util/bench_api_util.js';

const BenchesMiddleware = ({getState, dispatch}) => next => action => {
  switch(action.type){
    case BenchConstants.REQUEST_BENCHES:
       const success = data => dispatch(receiveBenches(data));
       fetchBenches(success);
       return next(action);
    default:
      return next(action);
  }
};

export default BenchesMiddleware;
