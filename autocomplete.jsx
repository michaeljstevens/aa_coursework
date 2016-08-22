import React from 'react';

class Autocomplete extends React.Component {
  constructor({names}) {
    super();
    this.names = names;
    this.state = {names: names};
  }

  filter(e) {
    let filtered = [];
    let search = e.target.value;
    let length = search.length;
    this.names.forEach( (name) => {
      if(name.slice(0, length).toLowerCase() === search.toLowerCase()) {
        filtered.push(name);
      }
    });
    this.setState({names: filtered});
  }

  link(e) {
    this.setState({names: [e.target.innerHTML]});
  }

  render() {
    let selected = this.state.names.map((name) => (
      <li key={name} onClick={this.link.bind(this)}>{name}</li>
    ));

    return (
      <div>
        <input onChange={this.filter.bind(this)} />
        <ul>
          { selected }
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
