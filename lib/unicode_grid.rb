# frozen_string_literal: true

require_relative 'unicode_box'

class UnicodeGrid
  attr_accessor :grid

  def initialize(width, height)
    @grid = Array.new(height) { Array.new(width) { UnicodeBox.new } }
  end

  def print
    @grid.each do |row|
      print_row(row)
    end
  end

  def set(grid_x, grid_y, value)
    @grid[grid_y][grid_x].set(value)
  end

  private

  def print_row(row)
    (0...3).each do |i|
      puts row.reduce(String.new('')) { |str, box| str + box.get_row(i).join('') }
    end
  end
end
