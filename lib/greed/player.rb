module Greed
  class Player
    attr_accessor :name
    attr_reader   :score
    attr_reader   :last_roll

    def initialize(options={})
      @name = options[:name]
      @dice = DiceSet.new
    end

    def roll(die=@dice.die_count)
      @dice.roll(die)
    end

    def last_roll
      @dice.values
    end
  end
end
