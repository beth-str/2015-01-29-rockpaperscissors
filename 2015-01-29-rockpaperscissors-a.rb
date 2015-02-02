
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

  def start_game    
    ask_player_for_move(@current_player)
    determine_winner
  end
  
  def ask_player_for_move(current_player)
    puts
    puts "#{@current_player.name}, it's your move:"
    @move = gets.chomp.capitalize.to_s
    # puts @move
    self.validate_move(@move)
    next_turn
  end

  def validate_move(move)
    until @moves.include?(@move) 
      puts "Your move is invalid. Try again. Choose: rock / paper / scissors"
      @move = gets.chomp.capitalize.to_s
    end
      @current_moves << @move
      p @current_moves
  end
  
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

# The method 'determine_winner' is doing too much.
# Should probably be 'compare_moves' 'determine_winner' and 'add_to_score',
# but I had trouble making them function properly when I split them up.  
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