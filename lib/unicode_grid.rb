# frozen_string_literal: true

require_relative 'unicode_box'

class UnicodeGrid
  def initialize(width, height)
    @grid = Array.new(height) { Array.new(width) { UnicodeBox.new } }
  end

  def print
    @grid.each do |row|
      print_row(row)
    end
  end

  private

  def print_row(row)
    (0...3).each do |i|
      puts row.reduce(String.new('')) { |str, box| str + box.get_row(i).join('') }
    end
  end
end
