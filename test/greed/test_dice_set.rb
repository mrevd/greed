require_relative '../test_helper'

module Greed
  class DiceSetTest < MiniTest::Test
    def setup
      @dice = Greed::DiceSet.new
    end

    def test_can_create_a_dice_set
      refute @dice.nil?
    end

    def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
      @dice.roll(5)
      assert @dice.values.is_a?(Array), "should be an array"
      assert_equal 5, @dice.values.size
      @dice.values.each do |value|
        assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
      end
    end

    def test_dice_values_do_not_change_unless_explicitly_rolled
      @dice.roll(5)
      first_time = @dice.values
      second_time = @dice.values
      assert_equal first_time, second_time
    end

    def test_dice_values_should_change_between_rolls
      @dice.roll(5)
      first_time = @dice.values

      @dice.roll(5)
      second_time = @dice.values

      refute_equal first_time, second_time
    end

    def test_you_can_roll_different_numbers_of_dice
      @dice.roll(3)
      assert_equal 3, @dice.values.size

      @dice.roll(1)
      assert_equal 1, @dice.values.size
    end

    def test_score_of_an_empty_list_is_zero
      @dice.roll(0)
      assert_equal 0, @dice.score
    end

    def test_score_of_a_single_roll_of_5_is_50
      @dice.values = [5]
      assert_equal 50, @dice.score
    end

    def test_score_of_a_single_roll_of_1_is_100
      @dice.values = [1]
      assert_equal 100, @dice.score
    end

    def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
      @dice.values = [1,5,5,1]
      assert_equal 300, @dice.score
    end

    def test_score_of_single_2s_3s_4s_and_6s_are_zero
      @dice.values = [2,3,4,6]
      assert_equal 0, @dice.score
    end

    def test_score_of_a_triple_1_is_1000
      @dice.values = [1,1,1]
      assert_equal 1000, @dice.score
    end

    def test_score_of_other_triples_is_100x
      @dice.values = [2,2,2]
      assert_equal 200, @dice.score

      @dice.score = 0
      @dice.values = [3,3,3]
      assert_equal 300, @dice.score

      @dice.score = 0
      @dice.values = [4,4,4]
      assert_equal 400, @dice.score

      @dice.score = 0
      @dice.values = [5,5,5]
      assert_equal 500, @dice.score

      @dice.score = 0
      @dice.values = [6,6,6]
      assert_equal 600, @dice.score
    end

    def test_score_of_mixed_is_sum
      @dice.values = [2,5,2,2,3]
      assert_equal 250, @dice.score

      @dice.score = 0
      @dice.values = [5,5,5,5]
      assert_equal 550, @dice.score

      @dice.score = 0
      @dice.values = [1,1,1,1]
      assert_equal 1100, @dice.score

      @dice.score = 0
      @dice.values = [1,1,1,1,1]
      assert_equal 1200, @dice.score

      @dice.score = 0
      @dice.values = [1,1,1,5,1]
      assert_equal 1150, @dice.score
    end

    def test_removal_of_scoring_die
      @dice.values = [1,1,1,1,1]
      assert_equal 0, @dice.die_count

      dice_1 = Greed::DiceSet.new
      dice_1.values = [5, 1, 3, 4, 1]
      assert_equal 2, dice_1.die_count

      dice_2 = Greed::DiceSet.new
      dice_2.values = [1, 1, 1, 3, 1]
      assert_equal 1, dice_2.die_count

      dice_3 = Greed::DiceSet.new
      dice_3.values = [2, 4, 4, 5, 4]
      assert_equal 1, dice_3.die_count
    end

  end
end
