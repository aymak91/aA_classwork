import React from 'react';


class TodoForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            title: '',
            body: '',
            done: false
        };
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    updateTitle(e) {
        this.setState({title: e.currentTarget.value}); 
    }

    updateBody(e) {
        this.setState({body: e.currentTarget.value}); 
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.receiveTodo(this.state); // dispatching the action
        this.setState({
            title: '',
            body: '',
            id: Math.floor(Math.random() * 1000000)
        });
    }

    render() {
        return(
        <div>
            <form onSubmit={this.handleSubmit}>
            <label>Title: 
                <br />
                <input type="text" value={this.state.title} 
                onChange={this.updateTitle}/><br />
            </label>

            <label>Body: 
                <br />
                <input type="text" value={this.state.body} 
                onChange={this.updateBody}/> <br />
            </label>

            <button>Create new todo!</button>
            </form>

        </div>
        
    )}
}

export default TodoForm;