
class Checker
  attr_reader :color

  def initialize(color, symbol = "\u25CF")
    @color = color
    @symbol = symbol
  end

  def to_s
    @symbol.send(color.to_sym)
  end
end