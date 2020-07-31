const View = require('./ttt-view.js');
const Game = require('../tic_tac_toe_node_solution/game.js');



  $(() => {
    // Your code here
    const game = new Game();
    const figure = $(".ttt");
    const view = new View(game, figure);

  });
