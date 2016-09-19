import * as ACTIONS from '../actions/pokemon_actions.js';
import * as API from '../util/api_util.js';


export default ({dispatch}) => (next) => (action) =>{
  switch (action.type) {
    case ACTIONS.POKEMON_CONSTANTS.REQUEST_ALL_POKEMON:
      let success1 = (data) => dispatch(ACTIONS.receiveAllPokemon(data));
      API.fetchAllPokemon(success1);
      return next(action);
    case ACTIONS.POKEMON_CONSTANTS.REQUEST_SINGLE_POKEMON:
      let success2 = (pokemon) => dispatch(ACTIONS.receiveSinglePokemon(pokemon));
      API.fetchSinglePokemon(action.id, success2);
      return next(action);
    case ACTIONS.POKEMON_CONSTANTS.CREATE_NEW_POKEMON:
      let success3 = (pokemon) => dispatch(ACTIONS.receiveNewPokemon(pokemon));
      API.createNewPokemon(action.pokemon, success3);
      return next(action);
    default:
    return next(action);

  }
};
