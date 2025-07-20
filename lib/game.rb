# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def computer_turn
    @board.grid.flatten.select { |box| box.get == ' ' }.sample.set('O')
  rescue StandardError
    nil
  end

  def player_turn
    col = prompt_user_col
    row = prompt_user_row
    @board.set(col, row, 'X')
  end

  def print_board
    @board.print
  end

  private

  def prompt_user_col
    print 'Column: '
    col = gets.chomp.to_i
    while col < 1 || col > 3
      puts 'Not a column! Choose a number between 1 and 3'
      print 'Column: '
      col = gets.chomp.to_i
    end
    col - 1
  end

  def prompt_user_row
    print 'Row: '
    row = gets.chomp.to_i
    while row < 1 || row > 3
      puts 'Not a row! Choose a number between 1 and 3'
      print 'Row: '
      row = gets.chomp.to_i
    end
    row - 1
  end
end
