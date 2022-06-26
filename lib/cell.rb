# frozen_string_literal: true

# Cell class holds the data of a piece that is inside it, and is in charge of making the checkers placed inside.
class Cell
  attr_reader :piece, :position

  def to_s
    piece ? piece.to_s : ' '
  end

  def initialize(checker_class, position = nil)
    @checker_class = checker_class
    @position = position
  end

  def place_symbol(color)
    return false if @piece

    @piece = @checker_class.new(color)
  end

  def piece_color
    piece&.color
  end
end
