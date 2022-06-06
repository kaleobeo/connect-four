# frozen_string_literal: true

class Cell
  attr_reader :piece

  CIRCLE = "\u25CF"

  def initialize(checker_class)
    @checker_class = checker_class
  end

  def place_symbol(color)
    @piece ||= @checker_class.new(color)
  end
end