
const Game = require('./game.js');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let g = new Game();
g.run(reader, completionCallBack);

function completionCallBack () {
  reader.question("Would you like to play again?(yes, no)", (input) => {
    if (input === "yes") {
      g = new Game();
      g.run(reader, completionCallBack);
    } else if (input === "no") {
      reader.close();
    }
  });
}
