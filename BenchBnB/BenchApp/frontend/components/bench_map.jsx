import React from 'react';
import MarkerManager from '../util/marker_manager.js';

class BenchMap extends React.Component {


  componentWillReceiveProps(props) {
    this.MarkerManager.updateMarkers(props.benches);
  }

  componentDidMount(){
    // find the `<map>` node on the DOM
    const mapDOMNode = this.refs.map;
    const mapOptions = {
      center: {lat: 37.7758, lng: -122.435}, // this is SF
      zoom: 13
    };
    this.map = new google.maps.Map(mapDOMNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);

    google.maps.event.addListener(this.map, 'idle', () => {
      const { north, south, east, west } = this.map.getBounds().toJSON();
      const bounds = {
        northEast: { lat:north, lng: east },
        southWest: { lat: south, lng: west }
      };
      this.props.updateBounds(bounds);
    });
    // set the map to show SF

    // wrap the mapDOMNode in a Google Map
  }

  render () {
    return (<div id='map_container' ref='map'></div>);
  }
}

export default BenchMap;
