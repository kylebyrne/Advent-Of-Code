module AOC
  Cell = Struct.new(:value, :marked)

  class Board
    def initialize(input)
      @rows = input.split("\n").map { |row|
        row.split.map { |value| Cell.new(value.to_i, false) }
      }
      @columns = @rows.transpose
    end

    def mark_number(number)
      @rows.each do |row|
        row.each do |cell|
          cell.marked = true if cell.value == number
        end
      end

      @columns.each do |column|
        column.each do |cell|
          cell.marked = true if cell.value == number
        end
      end
    end

    def bingo?
      @rows.any? { |row| row.all?(&:marked) } ||
        @columns.any? { |column| column.all?(&:marked) }
    end

    def score
      @rows.flat_map { |row|
        row.reject(&:marked).map(&:value)
      }.sum
    end
  end

  class Day4
    def initialize(input)
      numbers, *board_definitions = input.split("\n\n")

      @numbers = numbers.split(',').map(&:to_i)
      @boards = board_definitions.map{ |definition| 
        Board.new(definition)
      }
    end

    def play
      @numbers.each do |number|
        @boards.each do |board|
          board.mark_number(number)

          if board.bingo?
            return board.score * number
          end
        end
      end
    end
  end
end

input = File.read('inputs/day_four.txt')

day_4 = AOC::Day4.new(input)
puts SCORE: day_4.play
