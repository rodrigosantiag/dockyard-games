defmodule Games.WordleTest do
  use ExUnit.Case

  doctest Games.Wordle

  @green :green
  @yellow :yellow
  @grey :grey

  describe "feedback/2" do
    test "all green" do
      assert Games.Wordle.feedback("hello", "hello") == [@green, @green, @green, @green, @green]
    end

    test "all yellow" do
      assert Games.Wordle.feedback("hello", "lohel") == [
               @yellow,
               @yellow,
               @yellow,
               @yellow,
               @yellow
             ]
    end

    test "all grey" do
      assert Games.Wordle.feedback("hello", "aaaaa") == [@grey, @grey, @grey, @grey, @grey]
    end

    test "mixed feedback" do
      assert Games.Wordle.feedback("hello", "hlela") == [@green, @yellow, @yellow, @green, @grey]
    end
  end
end
