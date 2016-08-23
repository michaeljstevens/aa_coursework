import React from 'react';
import {Board, Tile} from '../minesweeper.js';
import BoardReact from './board';

class Game extends React.Component {
  constructor() {
    super();
    this.state = { board: new Board(10, 10) };
  }

  updateGame (tile, flagged) {
    if(flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({board: this.state.board});
  }

  restart() {
    this.setState({board: new Board(10, 10) });
  }

  render () {
    let final = (<div></div>);
    if (this.state.board.won()) {
      final = (
        <div className="final">
          <span>You won!</span>
          <button onClick={this.restart.bind(this)}>Restart</button>
        </div>
      );
    } else if (this.state.board.lost()) {
      final = (
        <div className="final">
          <span>You lose!</span>
          <button onClick={this.restart.bind(this)}>Restart</button>
        </div>
      );
    }
    return (
      <div>
        <BoardReact board={this.state.board} update={this.updateGame.bind(this)} />
        { final }
      </div>
    );
  }
}

export default Game;
