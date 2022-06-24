class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def color_rep
    "\u25CF".send(:color)
  end
end