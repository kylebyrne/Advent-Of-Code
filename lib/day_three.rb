module AOC
  class DiagnosticCollection
    attr_reader :values

    def initialize(values)
      @values = values
    end

    def most_common_bit_at_position(position, indeterminate_value=nil)
      tallied = tallied_values_at_position(position)
      max_keys = tallied.select { |k, v| v == tallied.values.max }.keys

      max_keys.length > 1 ? indeterminate_value : max_keys.first
    end
    
    def least_common_bit_at_position(position, indeterminate_value=nil)
      tallied = tallied_values_at_position(position)
      min_keys = tallied.select { |k, v| v == tallied.values.min }.keys

      min_keys.length > 1 ? indeterminate_value : min_keys.first
    end

    def tallied_values_at_position(position)
      bits_at_position(position).tally
    end

    def bits_at_position(position)
      @values.map { |line| line[position] }
    end

    def filter_lines_with_bit_criteria(bit_criteria, position)
      @values.filter { |line| line[position] == bit_criteria }
    end
  end

  class Day3
    def initialize(input)
      @input = input.lines(chomp: true)
    end

    def gamma_rate
      (0...number_of_bits).map { |position| 
        DiagnosticCollection.new(@input).most_common_bit_at_position(position)
      }.join.to_i(2)
    end

    def epsilon_rate
      (0...number_of_bits).map { |position| 
        DiagnosticCollection.new(@input).least_common_bit_at_position(position)
      }.join.to_i(2)
    end

    def power_rate
      epsilon_rate * gamma_rate
    end

    def oxygen_generator_rating
      collection = DiagnosticCollection.new(@input)
      bit_position = 0
      bit_criteria = collection.most_common_bit_at_position(bit_position, "1")
      candidates = collection.filter_lines_with_bit_criteria(bit_criteria, bit_position)

      while candidates.length > 1
        collection = DiagnosticCollection.new(candidates)
        bit_position += 1
        bit_criteria = collection.most_common_bit_at_position(bit_position, "1")
        candidates = collection.filter_lines_with_bit_criteria(bit_criteria, bit_position)
      end

      candidates.first.to_i(2)
    end

    def co2_generator_rating
      collection = DiagnosticCollection.new(@input)
      bit_position = 0
      bit_criteria = collection.least_common_bit_at_position(bit_position, "0")
      candidates = collection.filter_lines_with_bit_criteria(bit_criteria, bit_position)

      while candidates.length > 1
        collection = DiagnosticCollection.new(candidates)
        bit_position += 1
        bit_criteria = collection.least_common_bit_at_position(bit_position, "0")
        candidates = collection.filter_lines_with_bit_criteria(bit_criteria, bit_position)
      end

      candidates.first.to_i(2)
    end

    def life_support_rating
      oxygen_generator_rating * co2_generator_rating
    end

    private

    def number_of_bits
      @input.first.length
    end
  end
end

input = File.read('inputs/day_three.txt')

day_3 = AOC::Day3.new(input)

puts GAMMA_RATE: day_3.gamma_rate
puts EPSILON_RATE: day_3.epsilon_rate
puts POWER_RATE: day_3.power_rate
puts OXYGEN_GENERATOR_RATING: day_3.oxygen_generator_rating
puts CO2_GENERATOR_RATING: day_3.co2_generator_rating
puts LIFE_SUPPORT_RATING: day_3.life_support_rating
