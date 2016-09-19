const MessageStore = require('./message_store');

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
