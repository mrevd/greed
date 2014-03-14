require_relative '../test_helper.rb'

class PlayerTest < MiniTest::Test
  def setup
    @player = Greed::Player.new
  end

  def test_player_has_a_name
    assert_respond_to @player, :name
  end

  def test_player_can_roll
    assert_respond_to @player, :roll
  end

  def test_first_roll_uses_all_dice
    @player.roll
    assert_equal @player.last_roll.size, Greed::DiceSet::DIE
  end
end
