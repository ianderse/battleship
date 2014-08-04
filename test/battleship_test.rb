gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/battleship'

class BattleShipTest < Minitest::Test

  def setup
    @new_game = Battleship.new($stdin, $stdout)
  end

  def test_it_can_start_game
    skip
    @new_game.run_game('p')

  end

  def test_it_can_print_instructions
    assert_equal "instructions", @new_game.print_instructions
  end

  def test_it_prints_welcome_message
    assert_equal "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", @new_game.welcome
  end

  def test_it_can_quit
    assert_equal 0, @new_game.run_game('q')
  end


end
