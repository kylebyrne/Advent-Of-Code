require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_six'

class Day6Test < Minitest::Test
  INPUT = [3,4,3,1,2]

  def test_lantern_fish_count
    day_six = AOC::Day6.new(INPUT)

    day_six.simulate_days(18)
    assert_equal(26, day_six.number_of_fish)

    day_six.simulate_days(62)
    assert_equal(5934, day_six.number_of_fish)
  end
end
