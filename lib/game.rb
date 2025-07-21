# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @board.print
  end

  def computer_turn
    @board.grid.flatten.select { |box| box.get == ' ' }.sample.set('O')
    @board.print
  rescue StandardError
    nil
  end

  def player_turn
    col = prompt_user_col
    row = prompt_user_row
    until @board.get(col, row) == ' '
      puts 'Invalid: Already Taken!'
      col = prompt_user_col
      row = prompt_user_row
    end
    @board.set(col, row, 'X')
    @board.print
  end

  def finished?
    @board.full?
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
