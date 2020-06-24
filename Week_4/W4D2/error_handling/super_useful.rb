# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue StandardError => err
    puts "Encountered #{err}"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class InvalidFruitError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise InvalidFruitError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin 
    reaction(maybe_fruit) 
  rescue InvalidFruitError
    puts "Thanks for the coffee, but please try again. (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    retry
  rescue StandardError => err
    puts "You didn't give me fruit or coffee!!! #{err}"
  end
end  

# PHASE 4

class YearsKnownError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      # puts "You haven't known each other long enough to be best friends!"
      raise YearsKnownError, "you haven't known each other long enough"
    elsif name.length <= 0 
      raise "You need to know each other's names if you're going to be friends."
    elsif fav_pastime.length <= 0
      raise "If you don't have any hobbies, then you're going to be a really boring friend."
    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


