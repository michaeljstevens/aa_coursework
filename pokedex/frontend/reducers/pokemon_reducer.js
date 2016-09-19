import * as ACTIONS from '../actions/pokemon_actions.js';
import {merge} from 'lodash';
/*
  DefualtState = {
    pokemons: {},  //All Poke
    currentPokemon: {
      toys: {}
    }
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
      let newState2 = merge({}, state, {currentPokemon});
      let toyObj = {};
      currentPokemon.toys.forEach(toy=>{
        toyObj[toy.id] = toy;
      });
      newState2.currentPokemon.toys = toyObj;
      return newState2;
    case ACTIONS.POKEMON_CONSTANTS.RECEIVE_NEW_POKEMON:
      let newState3 = merge({}, state);
      newState3.pokemons[action.pokemon.id] = action.pokemon;
      return newState3;
    default:
      return state;
  }
};

export default pokemonReducer;
