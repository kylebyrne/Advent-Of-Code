module AOC
  class Day1
    def initialize(input)
      @input = input.map(&:to_i)
    end

    def simple_depth_check
      count_increasing_digits(@input)
    end

    def accumulated_depth_check
      accumulated_depths = @input.each_cons(3).map(&:sum)
      count_increasing_digits(accumulated_depths)
    end

    private

    def count_increasing_digits(array)
      array.each_cons(2).filter{ |a, b|
        a < b
      }.count
    end
  end
end


input = File.read('inputs/day_one.txt').split("\n")

puts AOC::Day1.new(input).simple_depth_check
puts AOC::Day1.new(input).accumulated_depth_check
