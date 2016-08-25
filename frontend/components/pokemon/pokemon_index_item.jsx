import React from 'react';
import {withRouter} from 'react-router';

const PokemonItemIndex = (props) => {
  const _handleClick = (router, url) =>{
    router.push(url);
  };
  const handClick = ()=>{
    _handleClick(props.router, `/pokemon/${props.pokemon.id}`);
  };

  return (
    <li onClick={handClick} className="pokemon-index-item">
              <h1>{props.pokemon.name}</h1>
              <img src={props.pokemon.image_url} alt=""/>
          </li>
  );
};

export default withRouter(PokemonItemIndex);
