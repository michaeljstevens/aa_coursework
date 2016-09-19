import {createStore, applyMiddleware} from 'redux';
import pokemonReducer from '../reducers/pokemon_reducer.js';
import PokemonMiddleware from '../middleware/pokemon_middleware.js';

const configureStore = ()=> (createStore(pokemonReducer,
                        applyMiddleware(PokemonMiddleware)));

export default configureStore;
