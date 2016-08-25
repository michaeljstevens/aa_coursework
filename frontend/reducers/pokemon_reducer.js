import * as ACTIONS from '../actions/pokemon_actions.js';
import {merge} from 'lodash';
/*
  DefualtState = {
    pokemons: {}
  }
*/

const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case ACTIONS.POKEMON_CONSTANTS.RECEIVE_ALL_POKEMON:
      let allPokemon = action.allPokemon;
      let newState = {};
      allPokemon.map(pokemon=>{
        newState[pokemon.id] = pokemon;
      });
      return merge({}, state, {pokemons: newState} );
    case ACTIONS.POKEMON_CONSTANTS.RECEIVE_SINGLE_POKEMON:
      let currentPokemon = action.pokemon;
      return merge({}, state, {currentPokemon});
    default:
      return state;
  }
};

export default pokemonReducer;
