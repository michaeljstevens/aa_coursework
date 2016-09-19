class MarkerManager {
  constructor(map){
    this.map = map;
    this.markers = [];
  }

  updateMarkers(benches){
    this.benches = benches;
    let toRemove = this._markersToRemove;
    this._benchesToAdd().forEach(this._createMarkerFromBench.bind(this));
    if (toRemove.length > 0) {
      this._markersToRemove().forEach(this._removeMarker);
    }
  }

  _benchesToAdd(){

    const alreadyMarkedIds = this.markers.map(marker => marker.benchId);
    const newBenches = this.benches;
    const newBenchIds = Object.keys(newBenches);
    let uniqueNewBenches = [];

    newBenchIds.forEach (id => {
      if(!alreadyMarkedIds.includes(id)) {
        uniqueNewBenches.push(newBenches[id]);
      }
    });
    return uniqueNewBenches;
  }

  _createMarkerFromBench(bench) {
    const pos = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position: pos,
      map: this.map,
      benchId: bench.id
    });
    // marker.addListener('click', () => this.handleClick(bench));
    // this.markers.push(marker);
  }

  _markersToRemove(){

    let benchesToRemove = [];
    const benchIds = Object.keys(this.benches);

    this.markers.forEach (marker => {
      if (!benchIds.includes(marker.benchId)) {
        benchesToRemove.push(marker);
      }
    });
  }

  _removeMarker(marker) {
    const idx = this.markers.indexOf( marker );
    this.markers[idx].setMap(null);
    this.markers.splice(idx, 1);
  }
}


export default MarkerManager;
