gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/ship'

class ShipTest < Minitest::Test

  def test_it_can_create_a_one_unit_ship
    @ship = Ship.new('test', 1)
    assert_equal 1, @ship.length
  end

  def test_it_can_create_a_multi_unit_ship
    @ship = Ship.new('test', 4)
    assert_equal 4, @ship.length
  end

  def test_a_ship_has_a_type
    @ship = Ship.new('test', 1)
    assert_equal "test", @ship.type
  end

  def test_a_length_1_ship_knows_where_it_is_located
    @ship = Ship.new('test', 1)
    assert_equal "", @ship.location
  end

  def test_a_longer_ship_knows_where_it_is_located
    @ship = Ship.new('test', 2, "A1 A2")
    assert_equal "A1 A2", @ship.location
  end

  def test_a_ship_is_not_sunk_by_default
    @ship = Ship.new('test', 2, "A1 A2")
    assert_equal false, @ship.sunk?
  end

  def test_a_ship_loses_a_hitpoint_if_hit
    @ship = Ship.new('test', 2, "A1 A2")
    @ship.hit
    assert_equal 1, @ship.hits
  end

  def test_a_ship_is_sunk_if_hits_equals_zero
    @ship = Ship.new('test', 2, "A1 A2")
    @ship.hit
    @ship.hit

    assert_equal true, @ship.sunk?
  end
end
