import expect from 'expect'
import deepFreeze from 'deep-freeze'
import { createStore, combineReducers } from 'redux'

import React, { Component } from 'react';
import { Provider, connect } from 'react-redux';
import ReactDOM from 'react-dom'


const todo = (state, action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return {
        id: action.id,
        text: action.text,
        completed: false
      };

    case 'TOGGLE_TODO':
      if (state.id !== action.id) {
        return state;
      }
      return Object.assign(
                state,
                { completed: !state.completed }
              );
    default:
      return state;
  }
};

const todos = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        todo(undefined, action)
      ];
    case 'TOGGLE_TODO':
      return state.map(t => todo(t, action));
    default:
      return state;
  }
};

const visibilityFilter = (
  state = 'SHOW_ALL',
  action
) => {
  switch (action.type) {
    case 'SET_VISIBILITY_FILTER':
      return action.filter;
    default:
      return state;
  }
};

const todoApp = combineReducers({
  todos,
  visibilityFilter
});


const getVisibleTodos = (
  todos,
  filter
) => {
  switch (filter) {
    case 'SHOW_ALL':
      return todos;
    case 'SHOW_COMPLETED':
      return todos.filter(
        t => t.completed
      );
    case 'SHOW_ACTIVE':
      return todos.filter(
        t => !t.completed
      );
  }
}


let nextTodoId = 0;
const TodoApp = ({ store }) => (
  <div>
    <AddTodo />
    <VisibleTodoList />
    <Footer />
  </div>
);

const mapStateToTodoListProps = (state) => {
  return {
    todos: getVisibleTodos(
      state.todos,
      state.visibilityFilter
    )
  };
};

const mapDispatchToTodoListProps = (dispatch) => {
  return {
    onTodoClick: (id) => {
        dispatch({
        type: 'TOGGLE_TODO',
        id
      })
    }
  };
};


//class VisibleTodoList extends Component {
//  componentDidMount() {
//    const { store } = this.context;
//    this.unsubscribe = store.subscribe(() =>
//      this.forceUpdate()
//    );
//  }
//
//  componentWillUnmount() {
//    this.unsubscribe();
//  }
//
//  render() {
//    const props = this.props;
//    const { store } = this.context;
//    const state = store.getState();
//
//    return (
//      <TodoList
//        todos={
//          getVisibleTodos(
//            state.todos,
//            state.visibilityFilter
//          )
//        }
//        onTodoClick={id =>
//          store.dispatch({
//            type: 'TOGGLE_TODO',
//            id
//          })
//        }
//      />
//    );
//  }
//}

//VisibleTodoList.contextTypes = {
//  store: React.PropTypes.object
//};


const TodoList = ({
  todos,
  onTodoClick
}) => (
  <ul>
    {todos.map(todo =>
      <Todo
        key = {todo.id}
        completed = { todo.completed }
        text = { todo.text }
        onClick = { () => onTodoClick(todo.id) }
       />
    )}
   </ul>
);

const Todo = ({
  onClick,
  completed,
  text
}) => (
<li
  onClick={onClick}
  style={{
    textDecoration:
      completed ?
        'line-through' :
        'none'
  }}
>
  {text}
</li>
);

let AddTodo = ({ dispatch }) => {
  let input;
  return (
    <div>
      <input ref={node => {
        input = node;
      }} />
      <button onClick={() => {
        dispatch({
          type: 'ADD_TODO',
          id: nextTodoId++,
          text: input.value
        })
        input.value = '';
      }}>
        Add Todo
      </button>
    </div>
  );
};
AddTodo = connect()(AddTodo);

const Link = ({
  active,
  children,
  onClick
}) => {
  if (active) {
    return <span>{children}</span>;
  }
  return (
    <a href='#'
       onClick = { e => {
         e.preventDefault();
         onClick();
       }}
    >
      {children}
    </a>
  );
};

const mapStateToLinkProps = (
  state,
  ownProps
) => {
  return {
    active:
      ownProps.filter ===
      state.visibilityFilter
  };
};

const mapDispatchToLinkProps = (
  dispatch,
  ownProps
) => {
  return {
    onClick: () => {
      dispatch({
        type: 'SET_VISIBILITY_FILTER',
        filter: ownProps.filter
      });
    }
  };
}

const FilterLink = connect(
  mapStateToLinkProps,
  mapDispatchToLinkProps
)(Link);

const Footer = () => (
    <p>
      Show:
      {' '}
      <FilterLink
        filter='SHOW_ALL'
      >
        ALL
      </FilterLink>
      {' '}
      <FilterLink
        filter='SHOW_ACTIVE'
      >
        Active
      </FilterLink>
      {' '}
      <FilterLink
        filter='SHOW_COMPLETED'
      >
        Completed
      </FilterLink>
    </p>

);

//class Provider extends Component {
//  getChildContext() {
//    return {
//      store: this.props.store
//    };
//  }
//
//  render() {
//    return this.props.children
//  }
//}
//Provider.childContextTypes = {
//  store: React.PropTypes.object
//};

const VisibleTodoList = connect(
  mapStateToTodoListProps,
  mapDispatchToTodoListProps
)(TodoList);

ReactDOM.render(
  <Provider store={createStore(todoApp)}>
    <TodoApp />
  </Provider>,
  document.getElementById('root')
);

