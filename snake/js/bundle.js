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

	const View = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Board = __webpack_require__(2);


	class View {
	  constructor(board, $display) {
	    this.board = new Board();
	    this.$el = $display;
	    $display.keydown(this.handleKeyEvent(event));
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
	        html += `<li class="${i, j}"></li>`;
	      }
	      html += "</ul>";
	    }
	    return html;
	  }

	}

	module.exports = View;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Snake = __webpack_require__(3);

	class Board {
	  constructor() {
	    this.snake = new Snake();
	  }



	}

	module.exports = Board; 


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Board = __webpack_require__(2)

	const SHIFTS = {
	  "N": [-1, 0], "S" : [1, 0], "E" : [0, 1], "W" : [0, -1]
	};

	class Snake {
	  constructor() {
	    this.direction = "N";
	    this.segments = [[0,0]];
	  }

	  move () {
	    window.setInterval( () => {
	      let newSeg = [];
	      let shift = SHIFTS[this.direction];
	      newSeg.push(this.segments[0] + shift[0]);
	      newSeg.push(this.segments[1] + shift[1]);
	      this.segments.pop();
	      this.segments.unshift(newSeg);
	      this.move();
	    }, 100);
	  }

	  turn(direction) {
	    this.direction = direction;
	  }
	}

	module.exports = Snake;

	//    0 1 2 3
	//
	// 0  0 1 2 3
	// 1  0 1 2 3
	// 1  0 1 2 3


/***/ }
/******/ ]);