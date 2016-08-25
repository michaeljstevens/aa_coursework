import React from 'react';
import {withRouter} from 'react-router';


class PokemonDetail extends React.Component {

  render () {
    let content = <h1></h1>;
    if (this.props.pokemon) {
      let toys = this.props.pokemon.toys;
      let toyList = toys.map( (toy) => {
        return <li>{toy.name}</li>;
      });
      content = (<section className="pokemon-detail">
          <ul>
            <img src={this.props.pokemon.image_url} alt=""/>
              <li><h2>{this.props.pokemon.name}</h2></li>
              <li>Type: {this.props.pokemon.type}</li>
              <li>Attack: {this.props.pokemon.attack}</li>
              <li>Defense: {this.props.pokemon.defense}</li>
              <li>Moves: &#34;{this.props.pokemon.moves}&#34;</li>
            <section className="toys">
                <h3>Toys</h3>
              <ul className="toy-list">
                {toyList}
              </ul>
            </section>
          </ul>
      </section>);
    }

    return (
      <div>
        {content}
      </div>
    );
  }

}


export default withRouter(PokemonDetail);
