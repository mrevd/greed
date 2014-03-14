module Greed
  class Game
    attr_accessor :players

    def initialize(number_of_players = 2)
      raise InvalidNumberOfPlayers if number_of_players < 2
      @players = []
      number_of_players.times do
        @players << Player.new(dice: @dice)
      end
    end
  end
end
