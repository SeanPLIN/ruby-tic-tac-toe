# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def computer_turn
    @board.grid.flatten.select { |box| box.get == ' ' }.sample.set('O')
  end

  def print
    @board.print
  end
end
