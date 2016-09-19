const humanPlayer = require("./player.js");
const Board = require("./board.js");


class Game {
  constructor(player1,player2) {
    this.player1 = new humanPlayer(player1, "X");
    this.player2 = new humanPlayer(player2, "O");
    this.board = new Board();
    this.current_player = this.player1;
  }


  display() {
    this.board.grid.forEach( (el) => {
      console.log(el);
    });
  }

  play( completionCallback ) {
    this.display();
    console.log(this.current_player);
    this.current_player.getMove( (move)=> {
      if( this.board.empty(move)) {
        this.board.placeMark(move, this.current_player.mark);
        this.display();
        if (this.board.won) {
          return (`${this.current_player} wins!`);
        } else {
            this.switchPlayer();
        }
      } else {
          console.log("Space already taken");
          this.play(completionCallback);
      }
  });

  }

  switchPlayer() {
    if (this.current_player === this.player1){
      this.current_player = this.player2;
    } else {
      this.current_player = this.player1;
    }
  }

}

let g = new Game("Lulu", "Sally");
g.play( ()=> {
  console.log("Game over!");
});
