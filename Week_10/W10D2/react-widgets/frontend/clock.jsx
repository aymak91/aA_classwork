import React from 'react';

export default class Clock extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
          time: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    render() {
      let hours = this.state.time.getHours().toString().padStart(2, '0');
      let minutes = this.state.time.getMinutes().toString().padStart(2, '0');
      let seconds = this.state.time.getSeconds().toString().padStart(2, '0');
      
      let date = this.state.time.toDateString();

        
        return (
          <div class="clock">
            <label for="time">Time:</label>
            <span class="time" id="time">{hours}:{minutes}:{seconds} PDT</span>
            < br />
            <label for="date">Date:</label>
            <span class="date" id="date">{date}</span>
          </div>
        );
    }

    tick() {
        this.setState({time: new Date()});
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }
}