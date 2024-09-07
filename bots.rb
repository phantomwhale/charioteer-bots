#!/usr/bin/env ruby
#
# requires the terminal-table gem: `$ gem install terminal-table`
#
require 'securerandom'
require 'terminal-table'

NUMBER_OF_BOTS = 5

Move = Data.define(:movement, :black, :red, :boost) do
  def corner?
    black ? "Corner" : nil
  end

  def attack?
    red ? "ATTACK" : nil
  end

  def boost?
    boost == 0 ? "-" : "+#{boost}"
  end
end

def roll_movement(first: false, last: false)
  black_die = SecureRandom.random_number(1..6)
  red_die = SecureRandom.random_number(1..6)
  boost_die = SecureRandom.random_number(1..6)

  black = black_die <= 4
  red = red_die == 3

  black_movement = (1 + black_die) / 2
  red_movement = (1 + red_die) / 2
  boost = boost_die >= 5 ? 3 : 0

  Move.new(movement: 4 + black_movement + red_movement, black:, red:, boost:)
end

rows = NUMBER_OF_BOTS.times.map { roll_movement }.each_with_index.map { |move, index| [index, move.movement, move.corner?, move.attack?, move.boost?]  }
puts Terminal::Table.new :headings => ['Position', 'Movement', 'Corner', 'Attack', 'Boost'], rows:
