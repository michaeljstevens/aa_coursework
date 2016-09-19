function View (game, $el) {
  this.game = game;
  $el.html(this.setupBoard());
  this.bindEvents();
}

View.prototype.bindEvents = function () {
  $('li').on('click', e => {
    let $square = $(e.currentTarget);
    let posArr = $square.data("pos").split(", ").map((el) => parseInt(el));
    console.log(posArr);
    try {
      this.game.playMove(posArr);
    }
    catch (error) {
      alert("Already clicked");
    }
    this.makeMove($square);
    return;
  });
};

View.prototype.makeMove = function ($square) {
  $square.text(this.game.currentPlayer);
  $square.addClass('white-background');
  if ($square.text() === 'x') {
    $square.addClass('xcolor');
  } else {
    $square.addClass('ocolor');
  }
  if (this.game.board.winner()) {
    $('ul').append($(`<h1>You win, ${this.game.currentPlayer}!</h1>`))
  }
};

View.prototype.setupBoard = function () {
  let board = "<ul>";
  for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      board += `<li data-pos='${i}, ${j}'></li>`;
    }
  }
  board += "</ul>";
  return board;
};

module.exports = View;
