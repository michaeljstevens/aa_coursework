import React from 'react';
import Tile from './tile';

class BoardReact extends React.Component {

  render () {
    let grid = this.props.board.grid.map( (row, rowIdx) => {
      let finalRow = row.map( (tile, colIdx) => {
        return (<Tile key ={colIdx} tile={tile} update={this.props.update} />);
      });
      return (<div key={rowIdx}>
        {finalRow}
      </div>);

    });
    return (
      <div className="grid">
        {grid}
      </div>
    );
  }
}

export default BoardReact;
