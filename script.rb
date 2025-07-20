# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new
game.computer_turn
game.print_board
game.player_turn
game.print_board
