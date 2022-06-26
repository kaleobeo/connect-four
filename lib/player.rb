# frozen_string_literal: true

# Player class holds a color that corresponds to the player it represents
class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def color_rep
    "\u25CF".send(:color)
  end
end
