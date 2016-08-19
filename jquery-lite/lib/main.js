const DOMNodeCollection = require('./dom_node_collection');
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
