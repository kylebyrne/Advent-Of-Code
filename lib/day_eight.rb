require "set"
module AOC
  class Decoder
    def initialize(input)
      @input = input.map { |digit| Set.new(digit.chars) }
      @map = Array.new(10)
      decode_digits
    end

    CONDITIONS = {
      0 => -> (map, digit) { digit.length == 6 && map[1].all?{ |d| digit.include?(d) } },
      1 => -> (map, digit) { digit.length == 2 },
      2 => -> (map, digit) { digit.length == 5 }, # Assuming all other 5s have been removed
      3 => -> (map, digit) { digit.length == 5 && map[1].all?{ |d| digit.include?(d) } },
      4 => -> (map, digit) { digit.length == 4 },
      5 => -> (map, digit) { digit.length == 5 && (digit - map[4]).length == 2},
      6 => -> (map, digit) { digit.length == 6 }, # Assuming all other ks have been removed
      7 => -> (map, digit) { digit.length == 3 },
      8 => -> (map, digit) { digit.length == 7 },
      9 => -> (map, digit) { digit.length == 6 && (digit - map[4]).length == 2 }
    }

    def decode_digits
      @remaining = @input
      [ 1, 4, 7, 8, 3, 5, 2, 9, 0, 6 ].each do |digit|
        condition = CONDITIONS[digit]
        @map[digit] = @remaining.detect { |d| condition.call(@map, d) }
        @remaining.delete(@map[digit])
      end
    end

    def decode(digit)
      @map.index(Set.new(digit.chars))
    end
  end

  class Line
    def initialize(line)
      @input, @output = line.split('|').map{ |val| val.split(' ') }

      @decoder = Decoder.new(@input)
    end

    def unique_values_in_output
      @output.filter{ |v| [2,4,3,7].include?(v.length) }
    end

    def output_value
      @output.map{ |digit| @decoder.decode(digit) }.join.to_i
    end
  end
  
  class Day8
    def initialize(input)
      @lines = input.split("\n").map{ |line| Line.new(line) }
    end

    def unique_values_in_output
      @lines.map(&:unique_values_in_output).flatten.count
    end

    def output_value
      @lines.sum(&:output_value)
    end
  end
end

input = File.read('inputs/day_eight.txt')

day_8 = AOC::Day8.new(input)
puts UNIQUE_VALUES_IN_OUTPUT: day_8.unique_values_in_output
puts OUTPUT_VALUE: day_8.output_value
