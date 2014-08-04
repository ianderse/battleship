gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/battleship'

class BattleShipTest < Minitest::Test

  def setup
    @new_game = Battleship.new($stdin, $stdout)
  end

  def test_it_can_quit
    assert_equal 0, @new_game.run_game('q')
  end

end
