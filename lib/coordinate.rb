# frozen_string_literal: true

# Coordinate holds info on a position in the board, it also implements helper methods to help collaborators find its neighbors.
class Coordinate
  attr_reader :row, :col

  def initialize(col, row)
    @row = row
    @col = col
    @max_row = 6
    @max_col = 7
  end

  def ==(other)
    return super unless other.is_a?(Coordinate)

    col == other.col && row == other.row
  end

  def out_of_bounds?
    row > @max_row || col > @max_col
  end

  def vert_line
    [up.up.up, up.up, up, self, down, down.down, down.down.down]
  end

  def horiz_line
    [left.left.left, left.left, left, self, right, right.right, right.right.right]
  end

  def diag_line_ne_sw
    [diag_ne.diag_ne.diag_ne, diag_ne.diag_ne, diag_ne, self, diag_sw, diag_sw.diag_sw, diag_sw.diag_sw.diag_sw]
  end

  def diag_line_nw_se
    [diag_nw.diag_nw.diag_nw, diag_nw.diag_nw, diag_nw, self, diag_se, diag_se.diag_se, diag_se.diag_se.diag_se]
  end

  protected

  def up
    up_coord_height = row + 1
    up_coord_height <= @max_row ? Coordinate.new(col, up_coord_height) : NullCoordinate.new
  end

  def down
    down_coord_height = row - 1
    down_coord_height.positive? ? Coordinate.new(col, down_coord_height) : NullCoordinate.new
  end

  def left
    left_coord_col = col - 1
    left_coord_col.between?(1, 7) ? Coordinate.new(left_coord_col, row) : NullCoordinate.new
  end

  def right
    right_coord_col = col + 1
    right_coord_col.between?(1, 7) ? Coordinate.new(right_coord_col, row) : NullCoordinate.new
  end

  def diag_ne
    up.right
  end

  def diag_nw
    up.left
  end

  def diag_sw
    down.left
  end

  def diag_se
    down.right
  end
end