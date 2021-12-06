module AOC
  class Day6
    class LanternFish
      def initialize(days_till_spawn, ocean)
        @days_till_spawn = days_till_spawn
        @ocean = ocean
      end

      def age_one_day
        case @days_till_spawn
        when 0
          give_birth
          reset_spawn_count
        else
          @days_till_spawn -= 1
        end
      end

      private

      def reset_spawn_count
        @days_till_spawn = 6
      end

      def give_birth
        @ocean.add_fish(LanternFish.new(8, @ocean))
      end
    end

    def initialize(input)
      @fish = input.map{ |days_till_spawn| LanternFish.new(days_till_spawn, self) }
      @new_fish = []
    end

    def simulate_days(number_of_days)
      number_of_days.times do |i|
        @fish.each(&:age_one_day)
        @fish.push(*@new_fish)
        @new_fish.clear
      end
    end

    def number_of_fish
      @fish.count
    end

    def add_fish(fish)
      @new_fish << fish
    end
  end
end

input = File.read('inputs/day_six.txt').split(",").map(&:to_i)

day_6 = AOC::Day6.new(input)
day_6.simulate_days(80)
puts NUMBER_OF_FISH: day_6.number_of_fish
