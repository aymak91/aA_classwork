class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (event) => {
      // debugger
      const $cell = $(event.target);
      this.makeMove($cell);
    });
  }

  makeMove($square) {
    let mark = this.game.currentPlayer;
    this.game.playMove($square.data("position"));
    const winner = this.game.winner();
    $square.html(mark);
    // $square.attr("class", mark);
    // debugger
    $square.addClass(mark);

    if(this.game.isOver()) {
      if (mark) {
        this.$el.addClass(`winner-${mark}`);
        // $("h2").html(`The winner is ${winner}`);
      }
      this.$el.addClass("game_over");
    }


    if (winner) {
      $("h2").html(`The winner is ${winner}`);
    }      
  }

  setupBoard() {
    // const grid = $(".ttt");
    // grid.append('<ul>');
    const $ul = $("<ul>");

    for(let row = 0; row < 3; row++) {
      for(let col = 0; col < 3; col++) {
        // grid.append('<li>');
        const $li = $("<li>");
        let liData = $li.data("position", [row, col]);
        // console.log(liData);
        $ul.append($li);
      }
    }

    // grid.append('</ul>');
    this.$el.append($ul);
  }
}

module.exports = View;
