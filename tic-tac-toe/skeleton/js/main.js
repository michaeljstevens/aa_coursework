const View = require('./ttt-view.js');
const Game = require('../../solution/game.js');

$( () => {
  new View(new Game(), $('figure.ttt'));
});
