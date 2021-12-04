module AOC
  class Day3
    def initialize(input)
      @input = input.lines(chomp: true)
    end

    def gamma_rate
      (0...number_of_bits).map { |position| 
        tallied_values_at_position(position).max_by(&:last).first
      }.join.to_i(2)
    end

    def epsilon_rate
      (0...number_of_bits).map { |position| 
        tallied_values_at_position(position).min_by(&:last).first
      }.join.to_i(2)
    end

    def power_rate
      epsilon_rate * gamma_rate
    end

    private

    def number_of_bits
      @input.first.length
    end

    def tallied_values_at_position(position)
      bits_at_position(position).tally
    end

    def bits_at_position(position)
      @input.map { |line| line[position] }
    end
  end
end

input = File.read('inputs/day_three.txt')

day_3 = AOC::Day3.new(input)

puts GAMMA_RATE: day_3.gamma_rate
puts EPSILON_RATE: day_3.epsilon_rate
puts POWER_RATE: day_3.gamma_rate * day_3.epsilon_rate
