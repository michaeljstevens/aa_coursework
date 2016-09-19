class Board {
  constructor() {
    this.grid = [ [[],[],[]],
                  [[],[],[]],
                  [[],[],[]] ];
    this.pieces = ["X","O"];
  }


  won() {
    for (var i = 0; i < this.grid.length; i++) {
     let j = 0;
        if (this.grid[i][j] === "X" && this.grid[i][j+1] === "X" && this.grid[i][j+2] === "X") {
          return (true);
        }
        else if (this.grid[i][j] === "X" && this.grid[i+1][j] === "X" && this.grid[i+2][j] === "X") {
          return (true);
        }
      }
    for (var i = 0; i < this.grid.length; i++) {
     let j = 0;
        if (this.grid[i][j] === "O" && this.grid[i][j+1] === "O" && this.grid[i][j+2] === "O")
          return (true);
        else if (this.grid[i][j] === "O" && this.grid[i+1][j] === "O" && this.grid[i+2][j] === "O") {
          return (true);
        }
      }
      if (this.grid[0][0] === "X" && this.grid[1][1] === "X" && this.grid[2][2] === "X") {
        return (true);
      } else if ((this.grid[0][2] === "X" && this.grid[1][1] === "X" && this.grid[2][0] === "X")) {
        return (true);
      } else if ((this.grid[0][0] === "O" && this.grid[1][1] === "O" && this.grid[2][2] === "O")) {
        return (true);
      } else if (this.grid[0][0] === "O" && this.grid[1][1] === "O" && this.grid[2][2] === "O") {
        return (true);
      } else {
        return (false);
      }
  }

  empty(pos) {
    console.log(parseInt(pos.split("")[0])
    if ((this.grid[pos[0]][pos[1]]) === undefined) {
      return (true);
    } else {
      return (false);
    }
  }

  placeMark(pos,mark) {
    if (this.empty(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
    }
  }
}

module.exports = Board;
