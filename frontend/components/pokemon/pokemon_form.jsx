import React from 'react';
import {merge} from 'lodash';

const TYPES = [
  "fire",
  "electric",
  "normal",
  "ghost",
  "psychic",
  "water",
  "bug",
  "dragon",
  "grass",
  "fighting",
  "ice",
  "flying",
  "poison",
  "ground",
  "rock",
  "steel"
].sort();

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { image_url: "", attack: "", defense: "",
    name: "", poke_type: "", moves: [] };
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  //  :image_url, :attack, :defense, :name, :poke_type, moves: []

  handleSubmit(e) {
    e.preventDefault();
    let data = merge({}, this.state);
    data["moves"] = ["Fire"];

    this.props.createNewPokemon(data);
    this.setState({ image_url: "", attack: "", defense: "",
    name: "", poke_type: "", moves: [] });
  }

  handleChange(field) {
    return(e) => {
      debugger
      e.preventDefault();
      this.setState({[field]: e.target.value});
    };
  }

  render () {
    let options = TYPES.map(type => {
      return <option value={type}>{type}</option>;
    });
    return(<section className="pokemon-detail">

        <ul>
        </ul>
        <form className="pokemon-form" onSubmit={this.handleSubmit}>
          <label>Name
            <input type="text" onChange={this.handleChange("name")} value={this.state.name} />
          </label>

          <label>Attack
            <input type="text" onChange={this.handleChange("attack")} value={this.state.attack}/>
          </label>

          <label>Defense
            <input type="text" onChange={this.handleChange("defense")} value={this.state.defense}/>
          </label>

          <label>Image URL
            <input type="text" onChange={this.handleChange("image_url")} value={this.state.image_url}/>
          </label>

          <label>Pokemon Types
            <select name="" onChange={this.handleChange("poke_type")}>
              {options}
            </select>
          </label>

          <button>Create Pokemon</button>
        </form>
      </section>);
  }
}


export default PokemonForm;
