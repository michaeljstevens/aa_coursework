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
