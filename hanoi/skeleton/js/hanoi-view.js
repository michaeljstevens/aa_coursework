function HanoiView(game, $el) {
  $el.html(this.setupTowers());
  this.game = game;
  this.firstRender();
  this.clickedPile = undefined;
  this.clickTower();

  // this.clear = function () {
  //   this.$el.html(this.setupTowers());
  //   this.clickTower();
  // };
  // this.render();
  // this.clickTower();
  // this.clickedPile = undefined;
}

HanoiView.prototype.clickTower = function () {
  $('ul').on("click", (e) => {
    let $pile = $(e.currentTarget);
    if (typeof this.clickedPile === 'undefined') {
      this.clickedPile = $pile.attr("class");
    } else {
      let newPile = $pile.attr("class");
      if (!this.game.move(parseInt(this.clickedPile), parseInt(newPile))) {
        alert("invalid move");
      } else {
        this.render(parseInt(this.clickedPile), parseInt(newPile));
        if (this.game.isWon()) {
          $('h1').append($(`<h1>You won!</h1>`));
        }
      }
      this.clickedPile = undefined;
    }
  });
};

HanoiView.prototype.setupTowers = function () {
  let towers = "";
  for (var i = 0; i < 3; i++) {
    towers += `<ul class="${i}"></ul>`;
  }
  return towers;
};

HanoiView.prototype.render = function (fromTowerIdx, toTowerIdx) {
  let $fromTower = $(`ul.${fromTowerIdx} li`);
  let $block = $fromTower.first().detach();
  $(`ul.${toTowerIdx}`).prepend($block);
};

HanoiView.prototype.firstRender = function () {
  let towers = this.game.towers;
  for (let i = 0; i < towers.length; i++) {
   let tower = towers[i];

   tower.forEach(function (el) {
     $(`ul.${i}`).prepend($(`<li class="block${el}"></li>`));
   });

  }
  return;
};



module.exports = HanoiView;
