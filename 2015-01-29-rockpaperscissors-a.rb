# rock/paper/scissors 
#require 'pry'
#require_relative 'driver.rb'
#require_relative 'player.rb'

#--------------------------------------------------
# module Games
class Game
  attr_accessor :player_1, :player_2, :moves, :current_moves, :winner, :current_player
  def initialize(player_1, player_2)
    @moves = ["Rock", "Paper", "Scissors"]
    @player_1, @player_2 = player_1, player_2
    @current_player = player_1
    @current_moves = Array.new
    @winner = ''
    start_game
  end

  def start_game    #this might be the driver in a way??
    # puts "Starting rock-paper-scissors..."
    # puts
    # until @current_moves.length == 2
    ask_player_for_move(@current_player)
    # end
    determine_winner
    # puts "Game Over"
  end
  
  def ask_player_for_move(current_player)
    puts "#{@current_player}, it's your move:"
    @move = gets.chomp.capitalize.to_s
    validate_move(@move)
    next_turn
  end

  def validate_move(move)
    until @moves.include?(@move)  
      puts "Your move is invalid. Try again. Choose: rock / paper / scissors"
      @move = gets.chomp.capitalize.to_s
    end
      @current_moves << @move
      p current_moves
  end
  
  def next_turn
    if @current_player == player_1
      @current_player = player_2
    else
      @current_player = player_1
    end
    until @current_moves.length == 2
    ask_player_for_move(@current_player)
    end
  end
  
  def determine_winner
      if @current_moves[0] == @current_moves[1]
    		puts "We have a tie!"
    	elsif ((@current_moves[0] == "Rock") && (@current_moves[1] == "Scissors")) 
    		puts "#{player_1} wins - #{@current_moves[0]} crushes #{@current_moves[1]}"
        @winner = player_1
        @loser = player_2
    	elsif ((@current_moves[0] == "Scissors") && (@current_moves[1] == "Paper")) 
    		puts "#{player_1} wins - #{@current_moves[0]} cuts #{@current_moves[1]}"
        @winner = player_1
        @loser = player_2
    	elsif ((@current_moves[0] == "Paper") && (@current_moves[1] == "Rock"))
    		puts "#{player_1} wins - #{@current_moves[0]} covers #{@current_moves[1]}"
        @winner = player_1
        @loser = player_2
    	else
    		puts "#{player_2} wins - #{@current_moves[1]} beats #{@current_moves[0]}"
        @winner = player_2
        @loser = player_1
    	end
      return @winner    #I actually need to return @winner and @loser
      puts @winner
      # add_to_scores
  end
end
# end
#binding.pry