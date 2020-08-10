import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import Root from "./components/root"
import todosReducer from './reducers/todos_reducer.js';
import {receiveTodo, receiveTodos} from './actions/todo_actions';
import { allTodos } from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    
    // FOR TESTING
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.allTodos = allTodos;
    // FOR TESTING


    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, root);
})