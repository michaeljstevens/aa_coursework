import React from 'react';
import {Provider} from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container.jsx';
import {Router, Route, hashHistory } from 'react-router';
import * as API from '../util/api_util.js';
import * as ACTIONS from '../actions/pokemon_actions';
import PokemonDetailContainer from '../components/pokemon/pokemon_detail_container.jsx';

const requestAllPokemon = (store) => (next, replace) =>{
  let success1 = (data) => store.dispatch(ACTIONS.receiveAllPokemon(data));
  API.fetchAllPokemon(success1);
};


const requestSinglePokemon = (store) => (next, replace) =>{
  let success2 = (data) => store.dispatch(ACTIONS.receiveSinglePokemon(data));
  API.fetchSinglePokemon(next.params.id, success2);
};

const Root = ({store}) =>{
  return(
    <Provider store={store} >
      <Router history={hashHistory}>

        <Route path="/" component={PokemonIndexContainer} onEnter={requestAllPokemon(store)}>
          <Route path="/pokemon/:id" component={PokemonDetailContainer} onEnter={requestSinglePokemon(store)} />
        </Route>

      </Router>
    </Provider>
  );
};

export default Root;
