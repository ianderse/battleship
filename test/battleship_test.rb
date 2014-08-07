gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/battleship'
require_relative '../lib/player_placement'

class BattleShipTest < Minitest::Test

  include PlayerPlacement

  def setup
    @new_game = Battleship.new($stdin, $stdout)
  end

  def test_it_can_quit
    skip
    assert_equal 0, @new_game.run_game('q')
  end

  def test_it_can_check_coordinates_are_adjacent_vertical
    assert_equal true, @new_game.check_adjacent_vertical("A1 B1")
  end

  def test_it_knows_coordinates_are_not_adjacent_vertical
    assert_equal false, @new_game.check_adjacent_vertical("A1 C1")
  end

  def test_it_can_check_coordinates_are_adjacent_horizontal
    assert_equal true, @new_game.check_adjacent_horizontal("A1 A2")
  end

  def test_it_knows_coordinates_are_not_adjacent_horizontal
    assert_equal false, @new_game.check_adjacent_horizontal("A1 A3")
  end

  def test_it_knows_an_invalid_shot
    #how to properly test modules?
    skip
    assert_equal false, @new_game.valid_choices.includ?("A5")
  end

end
