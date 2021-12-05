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
        range = [start_point.x, end_point.x].sort
        (range[0]..range[1]).map { |x| Point.new(x, start_point.y) }
      end
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
      points = horizontal_or_vertical_lines.
        flat_map(&:points_covered).
        tally.
        filter{ |_, count| count > 1 }.
        count
    end

    def horizontal_or_vertical_lines
      @lines.filter do |line|
        line.horizontal? || line.vertical?
      end
    end
  end
end

input = File.read('inputs/day_five.txt')

day_5 = AOC::Day5.new(input)
puts OVERLAPPING_VENTS: day_5.overlapping_vents
