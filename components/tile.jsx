import React from 'react';

class Tile extends React.Component {

  handleClick (e) {
    let flag = false;
    if(e.altKey) {
      flag = true;
    }
    this.props.update(this.props.tile, flag);
  }

  render () {
    let tileClass = "tile unexplored";
    let tileContent = "";
    if (this.props.tile.explored && this.props.tile.bombed) {
      tileClass = "tile bomb";
      tileContent = "💣";
    } else if (!this.props.tile.explored && this.props.tile.flagged) {
      tileClass = "tile flagged";
      tileContent = "⚑";
    } else if (this.props.tile.explored) {
      tileClass = "tile explored";
      if (this.props.tile.adjacentBombCount() !== 0) {
        tileContent = this.props.tile.adjacentBombCount();
      }
    }
    return (<div className={tileClass} onClick={this.handleClick.bind(this)}>{tileContent}</div>);
  }
}

export default Tile;
