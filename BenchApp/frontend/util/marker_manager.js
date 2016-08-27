class MarkerManager {
  constructor(map){
    this.map = map;
    this.markers = [];
  }

  updateMarkers(benches){

    console.log('time to update');
    if (benches.length > 0) {
      benches.forEach(bench => {
        if (!this.markers.includes(bench.description)) {
          this.markers.push(bench.description);
          let marker = new google.maps.Marker({
            position: {lat: bench.lat, lng: bench.lng},
            map: this.map,
            title: bench.description
          });
        }
      });
    }
  }



  // _benchesToAdd()
  //
  // _createMarkerFromBench()


}

export default MarkerManager;
