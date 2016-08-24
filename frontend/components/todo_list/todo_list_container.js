import { connect } from 'react-redux';
import { requestTodos, createTodo } from '../../actions/todo_actions';
import allTodos from '../../reducers/selectors';
import TodoList from './todo_list';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  requestTodos: () => dispatch(requestTodos()),
  createTodo: (e) => dispatch(createTodo(e))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
