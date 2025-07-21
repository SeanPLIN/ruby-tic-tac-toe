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
    declare_winner(:computer) if won?
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
    declare_winner(:player) if won?
  end

  def finished?
    @board.full? || won?
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

  WIN_CONDITIONS = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 0]]
  ].freeze

  def won?
    WIN_CONDITIONS.each do |condition|
      first_val = @board.get(condition[0][0], condition[0][1])
      unless first_val == ' '
        won = true
        condition.each do |pos|
          unless @board.get(pos[0], pos[1]) == first_val
            won = false
            break
          end
        end
      end
      return true if won
    end
    if @board.full?
      declare_winner(:draw)
      true
    end
    false
  end

  def declare_winner(winner)
    if winner == :player
      puts 'Congratulations, You Won!'
    elsif winner == :computer
      puts 'Sorry, You Lost!'
    else
      puts "It's a draw!"
    end
  end
end
