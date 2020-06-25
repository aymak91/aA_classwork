require_relative 'piece'

class Board

    def initialize
        @grid = Array.new(8) {Array.new(8, nil)}
        place_pieces
        @sentinal

    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end


    def place_pieces
        (0..@grid.length - 1).each do |row|
            (0..@grid.length - 1).each do |col|
                if [0, 1, 6, 7].include?(row)
                    pos = [row, col]
                    self[pos] = Piece.new(pos, self, :test) #color
                end
            end
        end
    end

  
    def move_piece(start_pos, end_pos) #color

        if start_pos[0] < 0 || start_pos[0] > 7 || start_pos[1] < 0 || start_pos[1] > 7
            raise "you have entered an invalid start position"
        elsif end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7 
            raise "you have entered an invalid end position"
        elsif self[start_pos] == nil
            raise "There is no piece at your start position"
        else
                self[start_pos] = nil
                self[end_pos] = Piece.new
        end
    end

    def valid_pos?(pos)
        #check to see if on board
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def find_king(color)
    end
    
    def pieces
    end

    def move_piece?(color, start_pos, end_pos)
    end
end