function HanoiView(game, $el) {
  this.$el = $el;
  this.game = game;
  this.clear = function () {
    this.$el.html(this.setupTowers());
    this.clickTower();
  };
  this.render();
  this.clickTower();
  this.clickedPile = undefined;
}

HanoiView.prototype.clickTower = function () {
  $('ul').on("click", (e) => {
    let $pile = $(e.currentTarget);
    if (typeof this.clickedPile === 'undefined') {
      this.clickedPile = $pile.attr("class");
    } else {
      let newPile = $pile.attr("class");
      this.game.move(parseInt(this.clickedPile), parseInt(newPile));
      this.clickedPile = undefined;
      this.render();
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

HanoiView.prototype.render = function () {

  this.clear();
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
