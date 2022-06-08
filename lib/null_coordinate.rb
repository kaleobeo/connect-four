# frozen_string_literal: true

class NullCoordinate
  def position
    nil
  end

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