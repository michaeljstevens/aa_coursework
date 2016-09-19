const View = require('./snake-view.js');
const Board = require('./board.js');

$( () => {
  new View(new Board(), $('figure.grid'));
});
