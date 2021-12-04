require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_two'

class Day2Test < Minitest::Test
  INPUT = <<~EOF
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
  EOF

  def setup
    @day_two = AOC::Day2.from_input(INPUT)
  end

  def test_navigation_sequence
    @day_two.run_sequence

    assert_equal(60, @day_two.depth)
    assert_equal(15, @day_two.horizontal_position)
  end
end
