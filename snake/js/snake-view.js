const Board = require('./board');


class View {
  constructor(board, $display) {
    this.board = new Board();
    $display.html(this.newBoard());
    this.$el = $display;
    $display.keydown(this.handleKeyEvent(event));
    this.render();
  }

  handleKeyEvent(event) {

    switch(event.which) {
      case 37:
        this.board.snake.turn("W");
        break;
      case 38:
        this.board.snake.turn("N");
        break;
      case 39:
        this.board.snake.turn("E");
        break;
      case 40:
        this.board.snake.turn("S");
        break;
      }
  }

  newBoard() {
    let html = "";
    for (let i = 0; i < 20; i++) {
      html += "<ul>";
      for (let j = 0; j < 15; j++) {
        html += `<li class="[${i}, ${j}]"></li>`;
      }
      html += "</ul>";
    }
    return html;
  }

  render() {
    setInterval( () => {
      let squares = this.board.snake.segments;
      this.newBoard();
      squares.forEach( (el) => {
        $(`li.${el}`).addClass("snake");
      });
    },100);
  }

}

module.exports = View;
