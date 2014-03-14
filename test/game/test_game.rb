require_relative '../test_helper.rb'

class GameTest < MiniTest::Test
  def setup
    @game = Greed::Game.new
  end

  def test_min_number_of_players_required
    assert_raises(InvalidNumberOfPlayers) do
      Greed::Game.new(1)
    end
  end

  def test_new_game_initializes_players
    assert_equal 2, @game.players.size

    @game_two = Greed::Game.new(4)
    assert_equal 4, @game_two.players.size
  end
end
