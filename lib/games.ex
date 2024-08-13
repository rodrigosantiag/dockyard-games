defmodule Games do
  @moduledoc """
  Documentation for `Games`.
  """

  @doc """
  Menu for the game.
  """
  def main(_args) do
    option =
      IO.gets("""
      What game would you like to play?
      1. Guessing Game
      2. Rock Paper Scissors
      3. Wordle

      enter "stop" to exit
      enter "score" to view your current score
      """)
      |> String.trim()

    case option do
      "1" ->
        Games.GuessingGame.play()

      "2" ->
        Games.RockPaperScissors.play()

      "3" ->
        Games.Wordle.play()

      "stop" ->
        IO.puts("Goodbye!")

      "score" ->
        IO.puts("""
        ==================================================
        Your score is #{Games.ScoreTracker.current_score()}
        ==================================================
        """)

        main([])

      _ ->
        IO.puts("Invalid option")
    end
  end
end
