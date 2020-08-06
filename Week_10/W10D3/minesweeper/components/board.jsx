import React from 'react';
import Tile from './tile'

class Board extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {

        let board = this.props.board.grid.map( (row, i) => {
            
            let tiles = row.map( (tile, j) => {
                return (
                    <Tile tile={tile} key={[i,j]} />
                )
            })

            return (
                <div className="row" key={i}>
                    {tiles}
                </div>
            )
        });

        return (
            <div>
                {board}
            </div>
        );
    }
}

export default Board;