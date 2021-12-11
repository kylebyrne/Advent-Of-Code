module AOC
  class Digit
    def initialize(segments)
      @segments = segments
    end

    def one_of_unique_values?
      [2, 4, 3, 7].include? @segments.length
    end
  end

  class Line
    def initialize(line)
      @input, @output = line.split('|').map{ |val| val.split(' ').map{ |v| Digit.new(v) }}
    end

    def unique_values_in_output
      @output.filter(&:one_of_unique_values?)
    end
  end
  
  class Day8
    def initialize(input)
      @lines = input.split("\n").map{ |line| Line.new(line) }
    end

    def unique_values_in_output
      @lines.map(&:unique_values_in_output).flatten.count
    end
  end
end

input = File.read('inputs/day_eight.txt')

day_8 = AOC::Day8.new(input)
puts UNIQUE_VALUES_IN_OUTPUT: day_8.unique_values_in_output
