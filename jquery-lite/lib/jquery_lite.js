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

	const DOMNodeCollection = __webpack_require__(1);
	// document.addEventListener("DOMContentLoaded", () => {
	//   let a = document.querySelectorAll("h1");
	//   console.log($l(a));
	// });
	//

	function $l(selector) {
	  let arr = [];
	  if (selector instanceof HTMLElement) {
	    return new DOMNodeCollection(Array.from(selector));
	  } else if (selector instanceof Function){
	    arr.push(selector);
	  } else {
	    return new DOMNodeCollection(Array.from(document.querySelectorAll(selector)));
	  }
	  arr.forEach((func) => {
	    document.addEventListener("DOMContentLoaded", func);
	  });
	}

	$l.extend = function (...objects) {
	  let merged = objects.shift();
	  objects.forEach((object) => {
	    merged.elements.concat(object.elements)
	  });
	  return merged;
	};


	window.$l = $l;


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(elements) {
	    this.elements = elements;
	  }
	  html(content) {
	    if (content) {
	      this.elements.forEach((el) => {
	        el.innerHTML = content;
	      });
	    } else {
	      return this.elements[0].innerHTML;
	    }
	  }

	  empty() {
	    this.elements.forEach((el) => {
	      el.innerHTML = "";
	    });
	  }

	  append(content) {
	    this.elements.forEach((node) => {
	      let inner = node.innerHTML;
	      if (toString.call(content) === '[object String]') {
	        node.innerHTML = inner + content;
	      } else {
	        content.elements.forEach((el) => {
	          inner = node.innerHTML;
	          node.innerHTML = inner + el.outerHTML;
	        });
	      }
	    });
	  }

	  attr(attribute) {
	    return this.elements[0].getAttribute(attribute);
	  }

	  addClass(className) {
	    this.elements.forEach((node) => {
	      node.setAttribute("class", className);
	    });
	  }

	  removeClass() {
	    this.elements.forEach((node) => {
	      node.removeAttribute("class");
	    });
	  }

	  children() {
	    let kids = [];
	    this.elements.forEach((node) => {
	      kids.push(node.children);
	    });
	    return new DOMNodeCollection(Array.from(kids[0]));
	  }

	  parent() {
	    let parents = [];
	    this.elements.forEach((node) => {
	      parents.push(node.parentNode);
	    });
	    return new DOMNodeCollection(Array.from(parents));
	  }

	  find(selector) {
	    let nodes = [];
	    this.elements.forEach((node) => {
	      nodes.push(node.querySelectorAll(selector));
	    });
	    return new DOMNodeCollection(Array.from(nodes[0]));
	  }

	  remove() {
	    this.elements.forEach((el) => {
	      el.outerHTML = "";
	    });
	  }
	  on(e, callback) {
	    this.elements.forEach((node) => {
	      node.addEventListener(e, callback);
	    });
	  }
	  off(e) {
	    this.elements.forEach((node) => {
	      node.removeEventListener(e);
	    });
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);