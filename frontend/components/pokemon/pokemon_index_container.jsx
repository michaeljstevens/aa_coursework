import React from 'react';
import {connect} from 'react-redux';
import * as ACTIONS from '../../actions/pokemon_actions.js';
import PokemonIndex from './pokemon_index.jsx';


const mapStateToProps = (state) => ({
  pokemon: state.pokemons
});

const mapDispatchToProps = (dispatch) =>({
  requestAllPokemon: () => dispatch(ACTIONS.requestAllPokemon()),
});

export default connect(mapStateToProps,
                      mapDispatchToProps)(PokemonIndex);
