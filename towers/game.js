const readline = require('readline');
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });



class Game {
  constructor() {
    this.stacks  = [[1,2,3],[],[]];
  }


  isValidMove(startTower, endTower) {
    if(this.stacks[endTower][0] < this.stacks[startTower][0] ) {
      return false;
    } else if (this.stacks[startTower].length === 0) {
      return false;
    } else {
      return true;
    }
  }

  move(startTower, endTower) {
    if (this.isValidMove(startTower, endTower)) {
      let disk = this.stacks[startTower].shift();
      this.stacks[endTower].unshift(disk);
      this.print();
      return true;
    } else {
      return false;
    }
  }

  print() {
    console.log(JSON.stringify(this.stacks));
  }

  isWon() {
    if ((this.stacks[1].length === 3) || (this.stacks[2].length === 3)) {
      return (true);
    } else {
      return (false);
    }
  }

  run (reader, completionCallBack) {
      this.promptMove(reader, (start_tower, endTower) => {
        if (!this.move(start_tower, endTower)) {
          console.log("Invalid move!");
        }
        if (this.isWon()) {
          completionCallBack();
        } else {
          this.run(reader, completionCallBack);
        }
      });
    }
}


Game.prototype.promptMove = function (reader, callback) {
  console.log(this.stacks);
  reader.question("From which stack will you remove a disk?", (input)=> {
    let start_tower = parseInt(input);
    reader.question("Where will you move it to?", (input2)=> {
    let target_tower = parseInt(input2);
    callback(start_tower, target_tower);
    });
  });
};

module.exports = Game;


// let g = new Game();
// g.run( () => {
//   console.log("Winner!!");
// });
// reader.close();
