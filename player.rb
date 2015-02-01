# require 'pry'
#require_relative 'driver.rb'
#require_relative '2015-01-29-rockpaperscissors-a.rb'

class Player
  attr_accessor :games_won, :games_played
  attr_writer :name
  def initialize(name)
    @name = name
    @games_won = 0
    @games_played = 0
  end
  
  def name
    @name
  end
  
  def add_to_games_played=(player)
    @games_played = @games_played += 1
  end
  
  
  def games_won=(player)
    if player == @winner
      @games_won += 1
    else 
      @games_won = @games_won
    end
  end
#
#
#
#   def add_to_scores
#     if @winner == player_1
#       @games_won += 1
#       @games_played += 1
#     else
#       @games_won = @games_won
#       @games_played += 1
#     end
#   end
# end
# binding.pry