import React from 'react';


const Clock = (time) => {

  return (<h1>Time: {time.time.toString()}</h1>);
};

const Weather = ({city, temp}) => (

  <div>
    <h1>{city}</h1>
    <h1>{temp}&deg;</h1>
  </div>
);


class WeatherClock extends React.Component {
  constructor() {
    super();
    this.state = {time: new Date(), city: "Loading...", temp: ""};
  }

  componentDidMount() {

    navigator.geolocation.getCurrentPosition( (position) => {
      const latitude = position.coords.latitude;
      const longitude = position.coords.longitude;
      var request = new XMLHttpRequest();
      request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=3f1f84c33e694344bc493b83f9e8c34a&units=imperial`, true);
      request.onload = (data) => {
        if (request.status >= 200 && request.status < 400) {
          let response = JSON.parse(data.target.response);
          this.setState({city: response.name, temp: response.main.temp});
        } else {
          this.setState({city: "Error"});
        }
      };
      request.send();
    });

    window.setInterval(() => {
      this.state.time.setSeconds(this.state.time.getSeconds() + 1);
      this.setState({time: this.state.time});
    }, 1000);


  }

  render() {
    return (
      <div>
        <Clock time={this.state.time} />
        <Weather city={this.state.city} temp={this.state.temp} />
      </div>
    );
  }

  componentWillUnmount() {}

}

export default WeatherClock;
