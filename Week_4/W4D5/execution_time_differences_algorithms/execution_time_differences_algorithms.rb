require 'byebug'

def my_min_p1(list) # O(n^2)
    min = 0

    (0...list.length).each do |i|
        (i + 1 ... list.length).each do |j|
            min = list[i] if list[i] < list[j] && list[i] < min
        end
    end
    min
end

def my_min_p2(list) # O(n)
    min = list.first

    (0...list.length - 1).each do |i| 
        min = list[i + 1] if list[i + 1] < min 
    end 
    min 
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_p1(list)
# p my_min_p2(list)

def largest_contiguous_subsum_p1(list) # O(n^3)

    subsets = []

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subsets << list[i..j]
        end
    end

    sum = subsets.first.sum
    subsets.each do |set|
        sum = set.sum if set.sum > sum
    end

    # sum_arr = subsets.map {|set| set.sum}
    # sum_arr.max
end

def largest_contiguous_subsum_p2(list)
    largest_sum = list.first
    current_sum = list.first

    # debugger
    (1...list.length).each do |i| 
        if (list[i] + current_sum < 0 && current_sum > current_sum + list[i]) || current_sum < 0
            current_sum = list[i]
        else
            current_sum += list[i] 
        end
        largest_sum = current_sum if current_sum > largest_sum
    end 
    largest_sum  
end




list = [5, 3, -7]
p largest_contiguous_subsum_p2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_p2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum_p2(list) # => -1 (from [-1])

list = [5, 3, -7, 10, 11]
p largest_contiguous_subsum_p2(list)