/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);