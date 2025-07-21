# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new

until game.finished?
  game.player_turn
  game.computer_turn unless game.finished?
end
