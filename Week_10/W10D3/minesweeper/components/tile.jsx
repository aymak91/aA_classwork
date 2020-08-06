import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.tiles = this.props.tiles;
    }

    handleClick(event) {

        
        // if(event.altKey) {
        //     this.setState({flagged: !this.state.flagged});
        // }
    }

    render() {
        let klass;

        // debugger

        if(this.props.tile.explored === true) {
            klass = `tile explored`;
        } else {
            klass = `tile unexplored`;
        }


        return(
            <div className={klass}
            onClick={(e) => this.handleClick(e)}>
             T
            </div>
        )
    }
}

export default Tile;