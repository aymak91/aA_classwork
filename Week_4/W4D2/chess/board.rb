require_relative 'piece'

class Board

    def initialize
        @grid = Array.new(8) {Array.new(8, nil)}
    end

    def place_pieces
        (0..@grid.length - 1).each do |row|
            (0..@grid.length - 1).each do |col|
                if [0, 1, 6, 7].include?(row)
                    @grid[row][col] = Piece.new
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
        # if start_pos < 0 || start_pos > 7 
        #     raise ""
        
    end
end