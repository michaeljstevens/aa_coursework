const Router = require("./router.js");
const Inbox = require("./inbox.js");

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
