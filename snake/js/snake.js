const Board = require('./board.js')

const SHIFTS = {
  "N": [-1, 0], "S" : [1, 0], "E" : [0, 1], "W" : [0, -1]
};

class Snake {
  constructor() {
    this.direction = "N";
    this.segments = [[0,0]];
  }

  move () {
    window.setInterval( () => {
      let newSeg = [];
      let shift = SHIFTS[this.direction];
      newSeg.push(this.segments[0] + shift[0]);
      newSeg.push(this.segments[1] + shift[1]);
      this.segments.pop();
      this.segments.unshift(newSeg);
      this.move();
    }, 100);
  }

  turn(direction) {
    this.direction = direction;
  }
}

module.exports = Snake;

//    0 1 2 3
//
// 0  0 1 2 3
// 1  0 1 2 3
// 1  0 1 2 3
