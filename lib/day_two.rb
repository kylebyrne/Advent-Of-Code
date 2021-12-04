module AOC
  class Day2
    attr_reader :horizontal_position, :depth

    def initialize(sequence)
      @sequence = sequence
      @depth = 0
      @horizontal_position = 0
    end

    def self.from_input(input)
      new(input.lines(chomp: true).map{ _1.split })
    end

    def run_sequence
      @sequence.each do |instruction|
        send(instruction.first, instruction.last)
      end
    end

    def forward(distance)
      @horizontal_position += distance.to_i
    end

    def down(distance)
      @depth += distance.to_i
    end

    def up(distance)
      @depth -= distance.to_i
    end
  end
end

input = File.read('inputs/day_two.txt')

day_2 = AOC::Day2.from_input(input)

day_2.run_sequence

puts DEPTH: day_2.depth
puts HORIZONTAL: day_2.horizontal_position
