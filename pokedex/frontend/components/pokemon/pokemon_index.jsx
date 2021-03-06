import React from 'react';
import PokemonItemIndex from './pokemon_index_item.jsx';
import PokemonFormContainer from './pokemon_form_container.jsx';

class PokemonIndex extends React.Component {




  render(){
    let pokeLis;
    if (this.props.pokemon) {
      let keys = Object.keys(this.props.pokemon);
      pokeLis = keys.map( (key) => {
        return <PokemonItemIndex pokemon={this.props.pokemon[key]} key={key}/>;
      });
    }
    return(
      <ul>
        <PokemonFormContainer />
        {pokeLis ? pokeLis : ""}
        {this.props.children}
      </ul>
    );
  }

}

export default PokemonIndex;
