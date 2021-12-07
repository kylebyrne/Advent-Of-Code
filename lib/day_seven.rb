module AOC
  class Day7
    def initialize(starting_state)
      @starting_state = starting_state
    end

    def minimum_fuel
      costs = search_bounds.each_with_object({}) do |position, store|
        store[position] = calculate_fuel_for_position(position)
      end

      costs.min_by { |_, cost| cost }.last
    end

    def calculate_fuel_for_position(position)
      @starting_state.map { |start|
        difference = (position - start).abs
        0.5 * difference * (difference + 1)
      }.sum
    end

    def search_bounds
      (@starting_state.min..@starting_state.max)
    end
  end
end

input = File.read('inputs/day_seven.txt').split(",").map(&:to_i)

day_7 = AOC::Day7.new(input)
puts MINIMUM_FUEL_POSITION: day_7.minimum_fuel
