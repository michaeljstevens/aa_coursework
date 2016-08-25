import React from 'react';
import {connect} from 'react-redux';
import * as ACTIONS from '../../actions/pokemon_actions.js';
import PokemonDetail from './pokemon_detail.jsx';


const mapStateToProps = (state) => ({
  pokemon: state.currentPokemon
});

// const mapDispatchToProps = (dispatch) =>({
//   requestAllPokemon: () => dispatch(ACTIONS.requestAllPokemon()),
// });

export default connect(mapStateToProps,
                      null)(PokemonDetail);
