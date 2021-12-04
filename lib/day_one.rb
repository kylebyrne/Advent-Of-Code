module AOC
  class Day1
    def initialize(input)
      @input = input
    end

    def run
      @input.each_cons(2).filter{ |a, b|
        a.to_i < b.to_i
      }.count
    end
  end
end


input = File.read('inputs/day_one.txt').split("\n")

puts AOC::Day1.new(input).run
