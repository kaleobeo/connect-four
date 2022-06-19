# frozen_string_literal: true

class Cell
  attr_reader :piece, :position

  def initialize(checker_class, position = nil)
    @checker_class = checker_class
    @position = position
  end

  def place_symbol(color)
    @piece ||= @checker_class.new(color)
  end
end