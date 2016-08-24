import React from 'react';
import {createTodo} from '../../actions/todo_actions';

class TodoForm extends React.Component {
  constructor() {
    super();
    this.state = {title: "", body: ""};
    this.updateForm = this.updateForm.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  updateForm (e) {
    console.log(this.props);
    e.preventDefault();
    this.props.createTodo({todo: this.state});
  }

  updateTitle (e) {
    this.setState({title: e.target.value});
  }

  updateBody (e) {
    this.setState({body: e.target.value});
  }

  render () {
    return(
      <div>
        <input value={this.state.title} onChange={this.updateTitle}></input>
        <textarea name="name" value={this.state.body} onChange={this.updateBody}/>
        <button onClick={this.updateForm}>Submit</button>
      </div>
    );
  }
}

export default TodoForm;
