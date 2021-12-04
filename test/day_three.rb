require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_three'

class Day3Test < Minitest::Test
  INPUT = <<~EOF
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
  EOF

  def test_power_rate_calculation
    day_three = AOC::Day3.new(INPUT)
    assert_equal(22, day_three.gamma_rate)
    assert_equal(9, day_three.epsilon_rate)
    assert_equal(198, day_three.power_rate)
  end

  def test_life_support_rating_calculation
    day_three = AOC::Day3.new(INPUT)
    assert_equal(23, day_three.oxygen_generator_rating)
    assert_equal(10, day_three.co2_generator_rating)
    assert_equal(230, day_three.life_support_rating)
  end
end
