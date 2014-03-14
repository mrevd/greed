module Greed
  class Game
    DIE = 5

    attr_accessor :players

    def initialize(number_of_players = 2)
      raise InvalidNumberOfPlayers if number_of_players < 2

      @players = []
      number_of_players.times do
        @players << Player.new
      end
    end
  end
end
