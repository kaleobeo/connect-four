# frozen_string_literal: true

class NullCoordinate
  attr_reader :row, :col
  
  def up
    self
  end

  def down
    self
  end

  def left
    self
  end

  def right
    self
  end

  def diag_ne
    self
  end

  def diag_nw
    self
  end

  def diag_sw
    self
  end

  def diag_se
    self
  end

  def ==(other)
    other.is_a?(NullCoordinate)
  end
end