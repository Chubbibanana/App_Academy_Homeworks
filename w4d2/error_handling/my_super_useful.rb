require 'byebug'
# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue
  nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    if maybe_fruit == 'coffee'
      raise ArgumentError, "Not coffee, silly! Give me a fruit!" 
    else
      raise RuntimeError, "No coffee means grumpy me >:("
      exit
    end
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
  maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue ArgumentError
    p 'Not coffee, silly! Give me a fruit!'
    retry
  rescue RuntimeError, "No coffee means grumpy me >:("
      p 'No coffee means grumpy me >:('
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
      raise 'Less than 5 years does not mean true friendship' if yrs_known < 5
      raise "You don't know enough about your friend to be a bestfriend :(" if name.length <= 0 || fav_pastime.length <= 0
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    rescue RuntimeError
      inputs = gets.chomp.split(" ")
      retry
    end
  end

  def reinitialize
    begin 
      initialize(name, yrs_known, fav_pastime)
    
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


