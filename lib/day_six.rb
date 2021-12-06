module AOC
  class Day6
    def initialize(starting_state)
      @starting_state = starting_state
    end

    def fish_after(number_of_days)
      # Initialize the number of fish at each day
      @fish_at_each_stage = (0..8).map { |days| @starting_state.count(days) || 0 }

      number_of_days.times do 
        wait_a_day
      end

      @fish_at_each_stage.sum
    end

    def wait_a_day
      # Push the ones giving birth to the back as new fish
      @fish_at_each_stage.rotate!
      # Reset those that just gave birth
      @fish_at_each_stage[6] += @fish_at_each_stage.last
    end
  end
end

input = File.read('inputs/day_six.txt').split(",").map(&:to_i)

day_6 = AOC::Day6.new(input)
puts NUMBER_OF_FISH: day_6.fish_after(256)
