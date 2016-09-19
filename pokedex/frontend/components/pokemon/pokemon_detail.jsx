import React from 'react';
import {withRouter} from 'react-router';


class PokemonDetail extends React.Component {


   _handleClick (router, url) {
      router.push(url);
    }

    handClick (id) {
      this._handleClick(this.props.router, `/pokemon/${this.props.pokemon.id}/toys/${id}`);
    }


  render () {
    let content = <h1></h1>;
    if (this.props.pokemon) {
      let toys = this.props.pokemon.toys;
      let toysKeys = Object.keys(this.props.pokemon.toys);
  
      let toyList = toysKeys.map( (key) => {
        return <li onClick={this.handClick.bind(this, toys[key].id)}>{toys[key].name}</li>;
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
                {this.props.children}
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
