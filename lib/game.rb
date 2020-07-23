class Game

  attr_accessor :players, :board , :player, :count_turn

  #Create players, a board and set count turn to 0
  def initialize
    @players = Array.new
    @cases = Board.new
    @count_turn = 0
    
  end

  # Create 2 distinct players, ask their names and asigns a symbol to each of them
  def ask_player_name
    puts "Saisis ton nom pour jouer avec le symbole O :"
    puts ":-)"
    puts "--> "
    @players << Player.new(gets.chomp.to_s, "O" )

    puts "Saisis ton nom pour jouer avec le symbole X :"
    puts "--> "
    @players << Player.new(gets.chomp.to_s, "X")
  end

  # Make players play one by one until 3 cases are aligned
  # Count each turn and show actualized board before the player is asked to play
  # Suggest a new set at the end of each set
  def select_player
    until @cases.aligned == true
      system "clear"
      @count_turn +=1
      puts "------------------------------------ROUND #{@count_turn}------------------------------------"
      @cases.show 
      @players.each do |i| 
        if @cases.aligned == false
          @cases.play_turn(i)
        else
          play_again
        end
      end
    end
  end

  # Suggest a new set at the end of each set
  def play_again
    if @cases.aligned == true 
      puts "Pour rejouer, tape 'Y'. Pour quitter le jeu, appuie sur une autre touche pour quitter le jeu : "
      response = gets.chomp.to_s.upcase
      if response == "Y"
        Game.new.perform
      else
        exit
      end
    end
  end

 #Perform previous methods in a specific order
  def perform
    ask_player_name
    select_player
  end

end