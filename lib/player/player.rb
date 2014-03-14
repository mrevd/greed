module Greed
  class Player
    attr_accessor :name
    attr_reader   :score
    attr_reader   :last_roll

    def initialize(options={})
      @name = options[:name]
    end

    def roll(die = Game::DIE)
      @last_roll = []

      die.times do
        @last_roll << rand(6) + 1
      end
    end
  end
end
