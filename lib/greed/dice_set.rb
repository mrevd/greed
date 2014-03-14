module Greed
  class DiceSet
    DIE = 5

    attr_reader :values

    def initialize
      @values ||= []
    end

    def roll(count)
      @values = []
      count.times do
        @values << 1 + rand(6)
      end
    end
  end
end
