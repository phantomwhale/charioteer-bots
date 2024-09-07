#!/usr/bin/env ruby
#
# requires the terminal-table gem: `$ gem install terminal-table`
#
require 'securerandom'
require 'terminal-table'
require 'io/console'

NUMBER_OF_BOTS = 5

Move = Data.define(:movement, :black, :red, :boost) do
  def corner? = black ? "Corner" : nil
  def attack? = red ? "ATTACK" : nil
  def boost? = boost.zero? ? "-" : "+#{boost}"
end

def roll_movement
  black_die = SecureRandom.random_number(1..6)
  red_die = SecureRandom.random_number(1..6)
  boost_die = SecureRandom.random_number(1..6)

  black = black_die <= 4
  red = red_die == 3

  black_movement = (1 + black_die) / 2
  red_movement = (1 + red_die) / 2
  boost = boost_die >= 5 ? 3 : 0

  Move.new(movement: 4 + black_movement + red_movement, black: black, red: red, boost: boost)
end

loop do
  rolls = Array.new(NUMBER_OF_BOTS) { roll_movement }

  rows = rolls.each_with_index.map do |move, index|
    boost = move.boost?
    boost += " (- if leading)" if index.zero? && move.boost.positive?
    boost += " (+3 if last)" if index + 1 == NUMBER_OF_BOTS && move.boost.zero?
    [index + 1, move.movement, move.corner?, move.attack?, boost]
  end

  puts Terminal::Table.new(headings: %w[Position Movement Corner Attack Boost], rows: rows)
  puts
  print "Press any key to roll again, or q to quit >"
  break if $stdin.getch == "q"

  puts
end
