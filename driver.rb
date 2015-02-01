#driver class for RPS
require 'pry'
require_relative 'player'
require_relative '2015-01-29-rockpaperscissors-a'


class Driver
  # include Games
  puts "Starting rock-paper-scissors..."
  puts
#   def initialize    #this might be the driver in a way??
  puts "Please enter the name of Player 1:"
  player_1 = gets.chomp
  Player.new(player_1)
  puts "Please enter the name of Player 2:"
  player_2 = gets.chomp
  Player.new(player_2)
  Game.new(player_1, player_2)
  # puts
  # Game::ask_player_for_move(@current_player)  #?? How do I call this?
  # Game::determine_winner                      #?? How do I call this method fromanother class?
  puts "Game Over"
end
# end
binding.pry