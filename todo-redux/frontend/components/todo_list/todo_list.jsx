import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form'

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }


  componentDidMount() {
    return this.props.requestTodos();
  }

  render() {
    let listLis = this.props.todos.map( (todo, idx) => {
      return <TodoListItem key={idx} todo={todo} destroyTodo={this.props.destroyTodo} updateTodo={this.props.updateTodo} />;
    });
    return (
      <div>
        <ul>
          {listLis}
        </ul>
        <TodoForm createTodo={this.props.createTodo}/>
      </div>
    );

  }

}

export default TodoList;
