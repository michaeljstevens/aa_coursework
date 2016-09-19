import React from 'react';
import {connect} from 'react-redux';
import * as ACTIONS from '../../actions/pokemon_actions.js';
import ToyDetail from './toy_detail.jsx';


const mapStateToProps = (state, ownProps) => {
  return {
    toy: state.currentPokemon.toys[ownProps.params.toyId]
  };
};

// const mapDispatchToProps = (dispatch) =>({
//   requestAllPokemon: () => dispatch(ACTIONS.requestAllPokemon()),
// });

export default connect(mapStateToProps,
                      null)(ToyDetail);
