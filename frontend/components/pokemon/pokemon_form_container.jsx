import React from 'react';
import {connect} from 'react-redux';
import * as ACTIONS from '../../actions/pokemon_actions.js';
import PokemonForm from './pokemon_form.jsx';


const mapDispatchToProps = (dispatch) =>({
  createNewPokemon: (data) => dispatch(ACTIONS.createNewPokemon(data)),
});

export default connect(null, mapDispatchToProps)(PokemonForm);
