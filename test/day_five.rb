require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_five'

class Day5Test < Minitest::Test
  INPUT = <<~EOF
  0,9 -> 5,9
  8,0 -> 0,8
  9,4 -> 3,4
  2,2 -> 2,1
  7,0 -> 7,4
  6,4 -> 2,0
  0,9 -> 2,9
  3,4 -> 1,4
  0,0 -> 8,8
  5,5 -> 8,2
  EOF

  def test_overlapping_hydrothermal_vents
    day_five = AOC::Day5.new(INPUT)
    assert_equal(5, day_five.overlapping_vents)
  end
end
