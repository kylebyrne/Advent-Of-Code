require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_seven'

class Day7Test < Minitest::Test
  INPUT = [16,1,2,0,4,2,7,1,2,14]

  def test_minimum_fuel
    assert_equal(37, AOC::Day7.new(INPUT).minimum_fuel)
  end
end
