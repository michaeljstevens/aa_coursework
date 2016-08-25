import React from 'react';

class PokemonIndex extends React.Component {

  componentDidMount () {

    this.props.requestAllPokemon();

  }

  render(){
    let pokeLis;
    if (this.props.pokemon) {
      let keys = Object.keys(this.props.pokemon);
      pokeLis = keys.map( (key) => {
        return (<li key={key}>
                  <h1>{this.props.pokemon[key].name}</h1>
                  <img src={this.props.pokemon[key].image_url} alt=""/>
              </li>);
      });
    }
    return(
      <ul>
        {pokeLis ? pokeLis : ""}
      </ul>
    );
  }

}

export default PokemonIndex;
