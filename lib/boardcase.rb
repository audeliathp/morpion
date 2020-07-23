  
class BoardCase
  attr_accessor :position, :content
#Initialize BoardCase class with 2 attributes (position + a content of each case in the board )
  def initialize(position, content)
    @position = position
    @content = content
  end
end 