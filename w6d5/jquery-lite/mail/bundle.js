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

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	document.addEventListener("DOMContentLoaded", () => {
	  let sidebarLi = document.querySelectorAll('.sidebar-nav li');
	  Array.from(sidebarLi).forEach((el) => {
	    el.addEventListener("click", (el2) => {
	      let inner = el2.currentTarget.innerText.toLowerCase();
	      window.location.hash = inner;
	    });
	  });
	  let content = document.querySelector(".content");
	  let route = new Routes ();
	  let router = new Router(content, route);
	  router.start();
	});

	class Routes {
	  constructor () {
	    this.inbox = new Inbox();
	  }
	}


/***/ },
/* 1 */
/***/ function(module, exports) {

	function Router (node, routes) {
	  this.node = node;
	  this.routes = routes;
	}
	Router.prototype.start = function() {
	  window.addEventListener('hashchange', this.render.bind(this));
	};
	Router.prototype.render = function() {
	  this.node.innerHTML = "";
	  let component = this.activeRoute();
	  if (component) {
	    this.node.innerHTML = "";
	    let node = component.render();
	    this.node.appendChild(node);
	  } else {
	    this.node.innerHTML = "";
	  }
	};

	Router.prototype.activeRoute = function() {
	  let hashFragment = window.location.hash;
	  hashFragment = hashFragment.split("");
	  hashFragment.shift();
	  hashFragment = hashFragment.join("");
	  let component = this.routes[hashFragment];
	  return component;
	};
	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	class Inbox {
	  constructor() {

	  }

	  render() {
	    let messages = MessageStore.getInboxMessages();
	    let ul = document.createElement("ul");
	    ul.setAttribute("class", "messages");
	    messages.forEach( (message) => {
	      ul.appendChild(this.renderMessage(message));
	    });
	    return ul;
	  }

	  renderMessage(message) {
	    let li = document.createElement("li");
	    li.setAttribute("class", "message");
	    let mfrom = document.createElement("span");
	    mfrom.setAttribute("class", "from");
	    mfrom.innerHTML = message.from
	    let msubject = document.createElement("span");
	    msubject.setAttribute("class", "subject");
	    msubject.innerHTML = message.subject;
	    let mbody = document.createElement("span");
	    mbody.setAttribute("class", "body");
	    mbody.innerHTML = message.body;
	    li.innerHTML = (`${mfrom.innerHTML}${msubject.innerHTML}${mbody.innerHTML}`);
	    return li;
	  }

	}

	module.exports = Inbox;


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {
	  sent: [
	    {to: "friend@mail.com", subject: "Check this out", body: "It's so cool"},
	    {to: "person@mail.com", subject: "zzz", body: "so booring"}
	  ],
	  inbox: [
	    {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out", body:
	"Stay at home mom discovers cure for leg cramps. Doctors hate her"},
	  {from: "person@mail.com", subject: "Questionnaire", body: "Take this free quiz win $1000 dollars"}
	]
	};

	class MessageStore {
	  constructor() {

	  }
	}

	MessageStore.getInboxMessages = function () {
	  return messages.inbox;
	};

	MessageStore.getSentMessages = function () {
	  return messages.sent;
	};


	module.exports = MessageStore;


/***/ }
/******/ ]);