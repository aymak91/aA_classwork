require "byebug"

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num >= 0 && num < self.store.length
      self.store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % self.store.length
    self.store[i] << num
  end

  def remove(num)
    i = num % self.store.length

    if self.include?(num)
      self.store[i].delete(num)
    end
  end

  def include?(num)
    i = num % self.store.length
    self.store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    i = num % self.store.length
    if !self.store[i].include?(num)
      self.store[i] << num
      self.count += 1
    end
  end

  def remove(num)
    i = num % self.store.length

    if self.include?(num)
      self.store[i].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    i = num % self.store.length
    self.store[i].include?(num)
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if self.count == self.num_buckets
      original_arr = self.store.dup
      @store = Array.new(self.num_buckets * 2) {Array.new}
      @count = 0

      original_arr.each do |row|
        row.each do |ele|
          self.insert(ele)
        end
      end
    end
  end
end
