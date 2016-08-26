import React from 'react';

class ToyDetail extends React.Component {

  render(){

    let toy = this.props.toy;

    return(<ul>
      <img src={toy.image_url} alt=""/>
        <li><h2>{toy.name}</h2></li>
        <li>Happiness: {toy.happiness}</li>
    </ul>);
  }
}

export default ToyDetail;
