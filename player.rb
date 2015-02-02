

class Player
  attr_accessor :games_won, :games_played, :name
  # attr_writer :name
  def initialize(name)
    @name = name
    @games_won = 0
    @games_played = 0
  end

  def games_played
    @games_played = @games_played += 1
  end

  def games_won
    @games_won += 1
  end
end
