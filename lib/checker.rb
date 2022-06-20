class Checker
  attr_reader :color, :symbol

  def initialize(color, symbol = "\u25CF")
    @color = color
    @symbol = symbol
  end

  def to_s
    @symbol.send(color.to_sym)
  end

  def ==(other)
    return super unless other.is_a?(Checker)

    color == other.color && symbol == other.symbol
  end
end