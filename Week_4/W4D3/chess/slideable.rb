# moves will be a method specific to each subclass
# slideable and steppable will be modules included in each subclass
# each subclass will have a method move_dirs and moves will use this method 

module Slideable
 
end
    HORIZONTAL_DIRS = [
        [1,0], 
        [-1,0], 
        [0,1], 
        [0,-1]
    ]

    DIAGONAL_DIRS = [
        [1,-1], 
        [1,1], 
        [-1,1], 
        [-1,1]
    ]
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        moves_dirs.each do |move|
            moves += grow_unblocked_moves_in_dir(move[0], move[1])
        end
    end


    private

    def moves_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
    #  Raise "wrong moves! for subclass"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x = pos[0]
        cur_y = pos[1]

        cur_x += dx 
        cur_y += dy

        moves = []
           
        while (0..7).include?(cur_x) && (0..7).include?(cur_y)
            if board[[cur_x,cur_y]].empty? 
                moves << [cur_x, cur_y]
                cur_x += dx 
                cur_y += dy
            elsif board[[cur_x,cur_y]].color != color
                moves << [cur_x, cur_y]
            else 
                break
            end
        end
        moves
    end
end
