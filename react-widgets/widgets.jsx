import React from 'react';
import ReactDOM from 'react-dom';
import Tab from './tabs';
import WeatherClock from './weather';
import Autocomplete from './autocomplete';

const tabs = [{"title": "one", "content": "First Pane"}, {"title": "two", "content": "Second Pane"}, {"title": "three", "content": "Third Pane"}];
const names = ["Abba", "Barney", "Barbara", "Jeff", "Jenny", "Sarah", "Sally", "Xander", "Matt", "Michael"];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');

  ReactDOM.render(
    <div className="main">
      <Tab tabs={tabs} />
      <WeatherClock />
      <Autocomplete names={names} />
    </div>, root
  );
});
