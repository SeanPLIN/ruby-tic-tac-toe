# frozen_string_literal: true

class UnicodeBox
  attr_accessor :box_arr

  TOP_LEFT = "\u256d"
  TOP_RIGHT = "\u256e"
  BOTTOM_RIGHT = "\u256f"
  BOTTOM_LEFT = "\u2570"

  def initialize(char = ' ')
    encode_box
    set(char)
  end

  def set(char)
    box_arr[1][1] = char
  end

  def get_row(row)
    box_arr[row]
  rescue StandardError
    nil
  end

  private

  def encode_box
    @box_arr = Array.new(3) { Array.new(3, ' ') }
    box_arr[0][0] = TOP_LEFT
    box_arr[0][2] = TOP_RIGHT
    box_arr[2][0] = BOTTOM_LEFT
    box_arr[2][2] = BOTTOM_RIGHT
  end
end
