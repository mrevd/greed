require_relative '../test_helper.rb'

module Greed
  class DiceSetTest < MiniTest::Test
    def test_all_dice_sets_have_five_die
      assert_equal Greed::DiceSet::DIE, 5
    end

    def test_can_create_a_dice_set
      dice = Greed::DiceSet.new
      refute dice.nil?
    end

    def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
      dice = Greed::DiceSet.new

      dice.roll(5)
      assert dice.values.is_a?(Array), "should be an array"
      assert_equal 5, dice.values.size
      dice.values.each do |value|
        assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
      end
    end

    def test_dice_values_do_not_change_unless_explicitly_rolled
      dice = Greed::DiceSet.new
      dice.roll(5)
      first_time = dice.values
      second_time = dice.values
      assert_equal first_time, second_time
    end

    def test_dice_values_should_change_between_rolls
      dice = Greed::DiceSet.new

      dice.roll(5)
      first_time = dice.values

      dice.roll(5)
      second_time = dice.values

      refute_equal first_time, second_time
    end

    def test_you_can_roll_different_numbers_of_dice
      dice = Greed::DiceSet.new

      dice.roll(3)
      assert_equal 3, dice.values.size

      dice.roll(1)
      assert_equal 1, dice.values.size
    end
  end
end
