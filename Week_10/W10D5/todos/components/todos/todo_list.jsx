import React from 'react';
// import TodolistContainer from './todo_list_container'
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
    constructor(props) {
        super(props);

    }

    render() {
    return(
        <div>
            <ul>
                {this.props.todos.map(todo => {
                    return(
                        <TodoListItem todo={todo} key={todo.id}/>
                    )
                })}
            </ul>

            <div>
                <TodoForm receiveTodo={receiveTodo} />
            </div>
                
        </div>
        
    )}
}

export default TodoList;