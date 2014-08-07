require 'colorize'
require_relative 'time_helper'

class Messager

  include TimeHelper

  attr_reader :output, :input

  def initialize(input, output)
    @input = input
    @output = output
  end

  def repeat_shot
    output.puts "Coordinate has already been shot at, shoot again".colorize(:red)
  end

  def miss
    system "clear"
    output.puts "You Miss!".colorize(:green)
  end

  def ai_miss
    output.puts "Computer Misses!".colorize(:green)
  end

  def hit
    system "clear"
    output.puts "You Hit!".colorize(:red)
  end

  def ai_hit
    output.puts "Computer Hit!".colorize(:red)
  end

  def sunk_ship(ship)
    output.puts "You sunk your opponents size #{ship.length} ship!".colorize(:green)
    sleep(0.5)
  end

  def sunk_player_ship(ship)
    output.puts "Computer sunk your size #{ship.length} ship!".colorize(:red)
    sleep(0.5)
  end

  def print_instructions
    output.puts "You have a grid from A1-D4, place a two unit ship and a three unit ship on the board.\nYour opponent will do the same.  You will alternate taking shots with your opponent, marking O for a miss and H for a hit.\nWhen a ship is fully hit, it is sunk.  When you sink all your opponents ships you win!"
  end

  def print_intro
    output.puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right."
  end

  def two_unit_ship
    output.print "Enter two adjacent squares for the two-unit ship (ie. A1 A2): "
  end

  def three_unit_ship
    output.print "Enter three adjacent squares for the three-unit ship (ie. A1 A2 A3): "
  end

  def welcome
    system "clear"
    output.puts "Welcome to BATTLESHIP".colorize(:cyan)
    output.puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?".colorize(:green)
  end

  def invalid
    output.print "invalid ship placement, try again: ".colorize(:red)
  end

  def invalid_shot
    output.print "invalid shot, try again: ".colorize(:red)
  end

  def play_again
    output.puts "(P)lay again or (q)uit?".colorize(:cyan)
  end

  def input
    input.gets.strip.downcase
  end

  def print_player_map(board)
    output.puts "\nYour turn! Here's what you know:\n===========\n"
    print_grid(board)
    output.print "\n===========\nEnter a coordinate to shoot at:"
  end

  def print_ai_map(board)
    output.puts "\nAfter my turn, here's your map:\n===========\n"
    print_grid(board)
    output.puts ""
  end

  def print_grid(board)
    #need to fix this to display map correctly spaced with nil values
    output.puts ". 1 2 3 4"
    output.print "A"
    board.values.to_a[0..3].each {|pos| @output.print " " + pos.to_s.colorize(:cyan)}
    output.print "\nB"
    board.values.to_a[4..7].each {|pos| @output.print " " + pos.to_s.colorize(:cyan)}
    output.print "\nC"
    board.values.to_a[8..11].each {|pos| @output.print " " + pos.to_s.colorize(:cyan)}
    output.print "\nD"
    board.values.to_a[12..15].each {|pos| @output.print " " + pos.to_s.colorize(:cyan)}
  end

  def win(shots=0, start, finish)
    output.puts "That was your opponents last ship!!".colorize(:green)
    output.puts "Congratulations, you win!".colorize(:cyan)
    output.puts "It took you #{shots} shots to sink your opponents ships."
    output.puts "You won in #{print_time_minutes(start, finish)} minutes and #{print_time_seconds(start, finish)} seconds."
  end

  def lose(shots=0, start, finish)
    output.puts "That was your last ship!!".colorize(:red)
    output.puts "You lose!".colorize(:red)
    output.puts "It took your opponent #{shots} shots to sink your ships."
    output.puts "You lost in #{print_time_minutes(start, finish)} minutes and #{print_time_seconds(start, finish)} seconds."
  end

end
