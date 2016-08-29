import {FilterConstants} from '../actions/filter_actions.js';
import {merge} from 'lodash';


const FilterReducer = (state = {}, action) => {
  switch(action.type){
    case FilterConstants.UPDATE_BOUNDS:
      const newFilter = {"bounds": action.bounds};
      return merge({}, state, newFilter);
    default:
      return state;
  }
};

export default FilterReducer;
