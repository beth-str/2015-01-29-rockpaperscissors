# Includes documentation for Game class / Player class / "Driver" (non-class)
#--------------------------------------------------
# Class: Game
#
# Description:  Executes a single game of 'Rock-Paper-Scissors'
#               when instantiated with two player objects.
#
# Data Members:
#   @moves                - Stores all possible moves in the game
#   @player_1, @player_2  - Stores the player objects (belonging to Player class)
#   @current_player       - Stores the current player
#   @current_moves        - Array that stores the moves that each player made 
#   @move                 - Stores the individual player move (temporarily)
#   @winner               - Stores the winner of each game 
#                           (currently not being used, but I hope to fix that)
# Public Methods:
#   #start_game
#   #ask_player_for_move
#   #validate_move
#   #next_turn
#   #determine_winner
#
#--------------------------------------------------
class Game
  attr_accessor :player_1, :player_2, :winner
  def initialize(player_1, player_2)
    @moves = ["Rock", "Paper", "Scissors"]
    @player_1, @player_2 = player_1, player_2
    @current_player = @player_1
    @current_moves = []
    @move = ''
    @winner = ''
    player_1.games_played
    player_2.games_played
    start_game
  end

#--------------------------------------------------
# Public: #start_game
#   Called from initialize to begin the game. (Driver should do this...)
#
# Parameters:
#   None
# 
# Returns:
#   None
#
# State Changes:
#   None
#--------------------------------------------------
  def start_game    
    ask_player_for_move(@current_player)
    determine_winner
  end

#--------------------------------------------------
# Public: #ask_player_for_move
#   Prompts the player for their move. Then calls the 
#   #validate_move method on that move.
#
# Parameters:
#   current_player  - Player: the current player
# 
# Returns:
#   None
#
# State Changes:
#   It sets @move to the current player's move
#--------------------------------------------------
  def ask_player_for_move(current_player)
    puts
    puts "#{@current_player.name}, it's your move:"
    @move = gets.chomp.capitalize.to_s
    # puts @move
    self.validate_move(@move)
    next_turn
  end

#--------------------------------------------------
# Public: #validate_move
#   Validates a players move to ensure it is one of three possible choices.
#   If move is valid, the move is pushed into an array.
#   Called from #ask_player_for_move.
#
# Parameters:
#   move          - The current player's stored move
# 
# Returns:
#   An array of moves.
#
# State Changes:
#   Array @current_moves is updated
#--------------------------------------------------
  def validate_move(move)
    until @moves.include?(@move) 
      puts "Your move is invalid. Try again. Choose: rock / paper / scissors"
      @move = gets.chomp.capitalize.to_s
    end
      @current_moves << @move
      p @current_moves
  end

#--------------------------------------------------
# Public: #next_turn
#   It updates the current player from one player to the next.
#   It checks to see if both players have had a turn and if they.  
#   have not, then it calls the method #ask_player_for_move.
#
# Parameters:
#   None
# 
# Returns:
#   None
#
# State Changes:
#   Sets @current_player from one player to the other player
#--------------------------------------------------
  def next_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
    until @current_moves.length == 2
    ask_player_for_move(@current_player)
    end
  end

#--------------------------------------------------
# Public: #determine_winner
#   1.  Compares the two player moves to determine the winner.
#   2.  Sets the winning player to player_1 or player_2
#   3.  Adds to the winning player's games_won total 
#       (by calling the method #games_won from the Player class)
#
#   (I recognize that the method should not be doing three things...)
#
# Parameters:
#   None
# 
# Returns:
#   @winner   - Player: the winner of this game
#
# State Changes:
#   Sets @winner to winning player
#--------------------------------------------------
# The method 'determine_winner' is doing too much.
# Should probably be 'compare_moves' 'determine_winner' and 'add_to_score',
# but I had trouble making them function properly when I split them up.  
#--------------------------------------------------
  def determine_winner
    if @current_moves[0] == @current_moves[1]
  		puts "We have a tie!"
  	elsif ((@current_moves[0] == "Rock") && (@current_moves[1] == "Scissors")) 
  		puts "#{player_1.name} wins - #{@current_moves[0]} crushes #{@current_moves[1]}"
      @winner = @player_1
      player_1.games_won
  	elsif ((@current_moves[0] == "Scissors") && (@current_moves[1] == "Paper")) 
  		puts "#{player_1.name} wins - #{@current_moves[0]} cuts #{@current_moves[1]}"
      @winner = @player_1
      player_1.games_won
  	elsif ((@current_moves[0] == "Paper") && (@current_moves[1] == "Rock"))
  		puts "#{player_1.name} wins - #{@current_moves[0]} covers #{@current_moves[1]}"
      @winner = @player_1
      player_1.games_won
  	else
  		puts "#{player_2.name} wins - #{@current_moves[1]} beats #{@current_moves[0]}"
      @winner = @player_2
      player_2.games_won
  	end
  end
end
#binding.pry
#--------------------------------------------------
#--------------------------------------------------
#--------------------------------------------------
# Class: Player
#
# Description:  Creates a player for a game and stores game record.
#
# Data Members:
#   @name         - Stores player name
#   @games_won    - Stores integer of games player has won
#   @games_played - Stores integer of games player has played
#
# Public Methods:
#   #games_played
#   #games_won
#--------------------------------------------------
class Player
  attr_accessor :games_won, :games_played, :name
  # attr_writer :name
  def initialize(name)
    @name = name
    @games_won = 0
    @games_played = 0
  end

#--------------------------------------------------
# Public: #games_played
#   Increments the number of games each player has played
#   (to be used for best of n series or overall player stats).
#
# Parameters:
#   None
# 
# Returns:
#   None
#
# State Changes:
#   Increments @games_played by 1
#--------------------------------------------------
  def games_played
    @games_played = @games_played += 1
  end

#--------------------------------------------------
# Public: #games_won
#   If player is the winner, increments @games_won by 1.
#
# Parameters:
#   None
# 
# Returns:
#   None
#
# State Changes:
#   Increments games_won by 1 (only if player is the winner)
#--------------------------------------------------
  def games_won
    @games_won += 1
  end
end
#--------------------------------------------------
#--------------------------------------------------
#--------------------------------------------------
# (non-)Class: Driver
#
# Description:  Creates player objects and begins the game
#               by instantiating a new game.
#
# Data Members:
#   None (at present)
#
# Public Methods:
#   None (at present)
#--------------------------------------------------
require 'pry'
require_relative 'player'
require_relative '2015-01-29-rockpaperscissors-a'
#-------------------------------------------------
# This really should be a Driver class, but when I did that, 
# I had trouble getting it to run. I am not sure where that introduced
# the error, but I think it had something to do with needing to do Driver.new
# to start the process. I thought the point of the Driver was to just
# make the game run on its own.

    puts "Starting rock-paper-scissors..."

# create new player objects from user input
    puts "Please enter the name of Player 1:"
    name_1 = gets.chomp
    player_1 = Player.new(name_1)
    puts
    puts "Please enter the name of Player 2:"
    name_2 = gets.chomp
    player_2 = Player.new(name_2)

# start a new game with player objects    
    g = Game.new(player_1, player_2)
    puts "Game Over"
    binding.pry
#--------------------------------------------------
