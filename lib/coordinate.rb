# frozen_string_literal: true

class Coordinate
  attr_reader :row, :col

  def initialize(col, row)
    @row = row
    @col = col
  end

  def up
    up_coord_height = row + 1
    up_coord_height < 7 ? Coordinate.new(col, up_coord_height) : nil
  end

  def ==(other)
    return super unless other.is_a?(Coordinate)

    col == other.col && row == other.row
  end
end