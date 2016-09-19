const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class humanPlayer {
  constructor(name, mark) {
    this.name = name;
    this.mark = mark;
  }

  getMove(callback) {
    reader.question("Choose a move: ", (input) => {
      callback(input);
    });

  }
}


module.exports = humanPlayer;
