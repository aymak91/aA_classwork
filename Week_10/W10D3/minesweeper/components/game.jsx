import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper'

class Game extends React.Component {
    constructor(props) {
        super(props);
        let board = new Minesweeper.Board(9,9);
        this.state = {board: board};

        // ALWAYS use "this" as context when we pass to other components
        this.updateGame = this.updateGame.bind(this); 
    }

    updateGame() {

    }

    render() {
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
        )
    }
}

export default Game;