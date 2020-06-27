require 'byebug'

class Array
    def my_uniq
        counter = Hash.new(0)
        new_arr = []
        self.each do |ele|
            if !counter.has_key?(ele)
                new_arr << ele
                counter[ele] += 1
            end
        end
        new_arr
    end

    def two_sum 
        pos = []
        (0...self.length-1).each do |idx_1|
            (idx_1+1..self.length-1).each do |idx_2|
                pos << [idx_1, idx_2] if self[idx_1]+self[idx_2] == 0
            end 
        end 
        pos 
    end 
end

def my_transpose(array)

    (0...array.length - 1).each do |i|
        (i + 1..array.length - 1).each do |j|
            array[i][j], array[j][i] = array[j][i], array[i][j]
        end
    end
    array
end

def stock_picker(stock_days)

    max = stock_days[1] - stock_days[0]
    max_pair = [0,1]
    
    (0...stock_days.length - 1).each do |i|
        (i + 1..stock_days.length - 1).each do |j|
            if stock_days[j] - stock_days[i] > max
                max = stock_days[j] - stock_days[i]
                max_pair = [i,j]
            end
        end
    end
    max_pair
end


# The objective of the puzzle is to move the entire stack to another rod, obeying the following simple rules:

# Only one disk can be moved at a time.
# Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack or on an empty rod.
# No larger disk may be placed on top of a smaller disk.

class Tower_of_Hanoi 
    attr_reader :towers, :disks

    def initialize(size)
        @towers = Array.new(3) {Array.new()} 
        #[[],[],[]]
        @disks = size
        start_game
    end 

    def start_game
        (1..@disks).each do |disk|
            @towers[0] << disk 
        end 
    end 

    def move_disk(tower_1 , tower_2)
        if !tower_1.between?(0, 2) || !tower_2.between?(0, 2)
            raise "Tower indexes are out of range"
        elsif @towers[tower_1].empty?
            raise "Cannot move disk from empty tower"
        elsif !@towers[tower_2].empty? && @towers[tower_2][0] < @towers[tower_1][0]
            raise "Cannot move bigger disk on smaller disk"
        else 
            @towers[tower_2].unshift(@towers[tower_1].shift) 
        end 
    end

    def get_input
        array = []
        puts @towers
        puts "Which tower do you want to take from?"
        array << gets.chomp.to_i
        puts "Which tower do you want to move to?"
        array << gets.chomp.to_i
        array
    end

    def won?
        @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
    end

    def run 
        while !won? 
            pos = get_input
            move_disk(pos[0], pos[1])
        end    
    end 

end 