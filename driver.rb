#driver class for RPS
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