# frozen_string_literal: true

class Board
  attr_accessor :raw_board

  def initialize
    @raw_board = Array.new(3) { Array.new(3, ' ') }
  end
end
