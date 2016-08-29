import {combineReducers} from 'redux';
import BenchesReducer from './benches_reducer';
import FilterReducer from './filter_reducer.js';

const RootReducer = combineReducers({benches: BenchesReducer,
                                    filter: FilterReducer});

export default RootReducer;
