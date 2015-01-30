# rock/paper/scissors 
# Level 0.1 / 0.3 (no classes)

wins_player_1 = 0
wins_player_2 = 0
moves = ["Rock", "Paper", "Scissors"]

class Array
  def random_element
    self[rand(length)]
  end
end

class Game
  def initialize(*name)
    @players = Hash.new
    name.each {|name| @playersname] = 0} 
  end
  def create_new_player(name)
    @
  end
  def prompt_for_move

  end
  def determine_winner
  
  end
end


class Player
  def initialize
    @name = name
    @move = move
    
  end
end
# Players should keep track of their names and moves, and should still only accept valid moves. From the user’s perspective, the game should appear to work exactly the same.

while (wins_player_1 < 2) && (wins_player_2 < 2)
puts
puts
puts "How about a nice game of Rock-Paper-Scissors?"
puts "You will test your skill against the computer."
puts "You go first. Enter your choice:"
move_player_1 = gets.chomp.capitalize.to_s

  until moves.include?(move_player_1)  
    puts "Your move is invalid. Try again. Choose: rock / paper / scissors"
    move_player_1 = gets.chomp.capitalize.to_s
  end  

puts "The computer will choose next. He is very smart."
move_player_2 = moves.random_element.capitalize.to_s
puts move_player_1
puts move_player_2

	if move_player_1 == move_player_2
		puts "We have a tie!"
	elsif ((move_player_1 == "Rock") && (move_player_2 == "Scissors")) 
		puts "You win - #{move_player_1} crushes #{move_player_2}"
		wins_player_1 = wins_player_1 + 1
	elsif ((move_player_1 == "Scissors") && (move_player_2 == "Paper")) 
		puts "You win - #{move_player_1} cuts #{move_player_2}"
		wins_player_1 = wins_player_1 + 1
	elsif ((move_player_1 == "Paper") && (move_player_2 == "Rock"))
		puts "You win - #{move_player_1} covers #{move_player_2}"
		wins_player_1 = wins_player_1 + 1
	else
		puts "Computer wins - #{move_player_2} beats #{move_player_1}"
		wins_player_2 = wins_player_2 + 1	
	end
puts
puts
puts "The score is: \nYou have #{wins_player_1} wins \nComputer has #{wins_player_2} wins" 

redo if (wins_player_1 < 2) && (wins_player_2 < 2)
end

if wins_player_1 > wins_player_2
	puts
	puts
	puts "You are the Grand Champion for best 2 out of 3!"
	puts "The score is: \nYou - #{wins_player_1} wins \nComputer - #{wins_player_2} wins" 
else 
	puts
	puts
	puts "Computer is the Grand Champion for best 2 out of 3!"
	puts "The score is: \nYou - #{wins_player_1} wins \nComputer - #{wins_player_2} wins" 
end