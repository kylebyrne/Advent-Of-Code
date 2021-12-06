require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_six'

class Day6Test < Minitest::Test
  INPUT = [3,4,3,1,2]

  def test_lantern_fish_count
    assert_equal(26, AOC::Day6.new(INPUT).fish_after(18))
    assert_equal(5934, AOC::Day6.new(INPUT).fish_after(80))
    assert_equal(26984457539, AOC::Day6.new(INPUT).fish_after(256))
  end
end
