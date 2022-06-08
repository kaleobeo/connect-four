# frozen_string_literal: true

class NullCoordinate
  attr_reader :row, :col
  
  def up
    NullCoordinate.new
  end

  def down
    NullCoordinate.new
  end

  def left
    NullCoordinate.new
  end

  def right
    NullCoordinate.new
  end
end