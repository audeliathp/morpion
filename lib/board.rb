class Board
  attr_accessor :cases, :aligned

  #Initialize 9 cases, specifying each case's position and content
  #Set aligned cases false by default
  def initialize
    @caseA1 = BoardCase.new("a1", " ")
    @caseA2 = BoardCase.new("a2", " ")
    @caseA3 = BoardCase.new("a3", " ")
    @caseB1 = BoardCase.new("b1", " ")
    @caseB2 = BoardCase.new("b2", " ")
    @caseB3 = BoardCase.new("b3", " ")
    @caseC1 = BoardCase.new("c1", " ")
    @caseC2 = BoardCase.new("c2", " ")
    @caseC3 = BoardCase.new("c3", " ")
    @aligned = false
    @cases =[@caseA1,@caseA2,@caseA3,@caseB1,@caseB2,@caseB3,@caseC1,@caseC2,@caseC3]
    @positions = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"]
  end

  #Ask the player where he/she wants to put his/her symbol on the board
  def play_turn (player)
    puts "#{player.name}, où veux-tu placer ton pion? (Indique une position au format a1, b1, etc.) : "
    puts "-->"
    @symbol = player.symbol
    position = gets.chomp.to_s
  
    #Indicate invalid / unavailable position and ask to play again
    if @positions.include?(position) == false
      puts "Cette position est invalide ou indisponible. Indique une position au format a1, b1, etc. :"
      puts "-->"
      position = gets.chomp.to_s
    end
    #Set chosen case as from now on unavailable and fill it with the players' symbol
    @positions.delete(position)
    @cases.map do |i|
      if i.position == position
        i.content = @symbol
      end
    end
    show
    victory

    #Declare winner when 3 cases are aligned or draw when none of the players succeed in aligned 2 cases
    if @aligned == true
      print "Bravo #{player.name}, tu as gagné !!! " 
    elsif @positions.size == 0 
      puts "Match nul !"
      @aligned = true
    end
  end

  # Set winning combinations 
  def victory

    if @caseA1.content == @caseA2.content && @caseA1.content == @caseA3.content && @caseA1.content != " "
      @aligned = true
    end

    if @caseB1.content == @caseB2.content && @caseB1.content == @caseB3.content && @caseB1.content != " "
      @aligned = true
    end

    if @caseC1.content == @caseC2.content && @caseC1.content == @caseC3.content && @caseC1.content != " "
      @aligned = true
    end

    if @caseA1.content == @caseB1.content && @caseA1.content == @caseC1.content && @caseA1.content != " "
      @aligned = true
    end

    if @caseA2.content == @caseB2.content && @caseA2.content == @caseC2.content && @caseA2.content != " "
      @aligned = true
    end

    if @caseA3.content == @caseB3.content && @caseA3.content == @caseC3.content && @caseA3.content != " "
      @aligned = true
    end

    if @caseA1.content == @caseB2.content && @caseA1.content == @caseC3.content && @caseA1.content != " "
      @aligned = true
    end

    if @caseA3.content == @caseB2.content && @caseA3.content == @caseC1.content && @caseA3.content != " "
      @aligned = true
    end
  end

  # Set empty board at initialization that will be filled at each playerr's turn
  def show
    puts ""
    puts " "*36 + "1  2  3"
    puts " "*33 + "a #{@caseA1.content} | #{@caseA2.content} | #{@caseA3.content}"
    puts " "*35 + "---------"
    puts " "*33 + "b #{@caseB1.content} | #{@caseB2.content} | #{@caseB3.content}"
    puts " "*35 + "---------"
    puts " "*33 + "c #{@caseC1.content} | #{@caseC2.content} | #{@caseC3.content}"
    puts "\n\n"
  end
end