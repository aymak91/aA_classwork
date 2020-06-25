require_relative "board.rb"
require_relative "steppable.rb"
require_relative "slideable.rb"

class Piece
    attr_reader :color, :position, :board
    
    def initialize(pos, board, color)
        @pos = pos
        @board = board
        @color = color
    
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end


end

class Queen < Piece
   include Slideable
end

class King < Piece
    include Steppable
end

class Knight < Piece
    include Steppable
end

class Pawn < Piece
end

class Bishop < Piece
    include Slideable
end

class Rook < Piece
    include Slideable
end

