# frozen_string_literal: true

require_relative 'unicode_grid'

class Board < UnicodeGrid
  def initialize
    super(3, 3)
  end

  def full?
    @grid.flatten.each { |box| return false if box.get == ' ' }
    true
  end
end
