require_relative "piece.rb"
require_relative "board.rb"
require_relative "display.rb"

class Game
    def initialize
        @board = Board.new
        @display = Display.new
        @players = {}
        @current_player
    end
end