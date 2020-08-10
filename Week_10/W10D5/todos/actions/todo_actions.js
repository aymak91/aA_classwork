export const RECEIVE_TODO = 'RECEIVE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
// export const DELETE_TODO = 'DELETE_TODO';

// action creators are FUNCTIONS that create action OBJECTS
export const receiveTodo = todo => ({ 
    type: RECEIVE_TODO,
    todo
})

export const receiveTodos = todos => ({
    type: RECEIVE_TODOS,
    todos
})

// export const deleteTodo = {
//     type: DELETE_TODO,
//     todo
// }