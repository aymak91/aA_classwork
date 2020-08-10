import React from 'react';
import TodolistContainer from './todos/todo_list_container'


const App = (props) => {
    return (
        <div>
            <h1>Todos</h1>
            <TodolistContainer />
        </div>
    )
};

export default App;