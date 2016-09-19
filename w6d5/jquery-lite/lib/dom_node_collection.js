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
