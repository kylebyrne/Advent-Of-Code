module AOC
  Point = Struct.new(:x, :y)
  class Line < Struct.new(:start_point, :end_point)
    def horizontal?
      start_point.y == end_point.y
    end

    def vertical?
      start_point.x == end_point.x
    end
    
    def points_covered
      if vertical?
        range = [start_point.y, end_point.y].sort
        (range[0]..range[1]).map { |y| Point.new(start_point.x, y) }
      else
        (left_most_point.x..right_most_point.x).map { |x| Point.new(x, (gradient * x + y_intercept).to_i) }
      end
    end

    def left_most_point
      start_point.x < end_point.x ? start_point : end_point
    end

    def right_most_point
      start_point.x < end_point.x ? end_point : start_point
    end

    def gradient
      (right_most_point.y - left_most_point.y).to_f / (right_most_point.x - left_most_point.x)
    end

    def y_intercept
      left_most_point.y - gradient * left_most_point.x
    end
  end

  class Day5
    def initialize(input)
      @lines = input.split("\n").map do |line|
        _, start_x, start_y, end_x, end_y = line.match(/^(\d+),(\d+) -> (\d+),(\d+)$/).to_a.map(&:to_i)
        Line.new(Point.new(start_x, start_y), Point.new(end_x, end_y))
      end
    end

    def overlapping_vents
      points = @lines.
        flat_map(&:points_covered).
        tally.
        filter{ |_, count| count > 1 }.
        count
    end
  end
end

input = File.read('inputs/day_five.txt')

day_5 = AOC::Day5.new(input)
puts OVERLAPPING_VENTS: day_5.overlapping_vents
