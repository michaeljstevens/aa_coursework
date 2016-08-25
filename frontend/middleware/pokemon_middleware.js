import * as ACTIONS from '../actions/pokemon_actions.js';
import * as API from '../util/api_util.js';


export default ({dispatch}) => (next) => (action) =>{
  switch (action.type) {
    case ACTIONS.POKEMON_CONSTANTS.REQUEST_ALL_POKEMON:
      let success = (data) => dispatch(ACTIONS.receiveAllPokemon(data));
      API.fetchAllPokemon(success);
      return next(action);
    default:
    return next(action);

  }
};
