import React from 'react';

class Tab extends React.Component {
  constructor( tabsArr ) {
    super();
    this.state = {tabsArr: tabsArr, selected: 0};

  }

  getSelected(idx) {
    this.setState({selected: idx});
  }

  render() {

    let data = this.state.tabsArr.tabs.map((tab, idx) => {
      // debugger
      return (
        <li key={tab.title} onClick={this.getSelected.bind(this, idx)}>{tab.title}</li>
      );
    });

    let content = this.state.tabsArr.tabs[this.state.selected].content;

    return (
      <div>
        <h1>Tabs</h1>
        <ul>
          {data}
        </ul>
        <div>
          {content}
        </div>
      </div>
    );
  }
}

export default Tab;
