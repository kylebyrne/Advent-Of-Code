require 'minitest'
require 'minitest/autorun'

require_relative '../lib/day_one'

class Day1Test < Minitest::Test
  INPUT = [
    199,
    200,
    208,
    210,
    200,
    207,
    240,
    269,
    260,
    263
  ]

  def test_basic_input
    output = AOC::Day1.new(INPUT).run
    assert_equal(7, output)
  end
end
