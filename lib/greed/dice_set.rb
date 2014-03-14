module Greed
  class DiceSet
    attr_reader   :die_count
    attr_accessor :values, :score

    def initialize
      @score = 0
      @die_count = 5
      @values ||= []
    end

    def roll(count)
      @values = []
      count.times do
        @values << 1 + rand(6)
      end
      record_score
    end

    def values=(rolled=[])
      @values = rolled
      record_score
    end

    private

    def record_score
      ones = values.count(1)
      fives = values.count(5)

      @score += 1000 if ones >= 3
      @score += 100 * (ones % 3)
      @score += 50 * (fives % 3)

      @die_count -= ones + fives

      values.uniq.each do |roll|
        roll_count = values.count(roll)
        if roll_count >= 3 && roll != 1
          @score += 100 * roll
          @die_count -= roll_count
        end
      end
    end
  end
end
