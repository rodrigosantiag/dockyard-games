defmodule Games.RockPaperScissors do
  @moduledoc """
  Rock, Paper, Scissors game
  """

  alias Games.ScoreTracker
  alias Games

  @doc """
  Play the game
  """
  @spec play() :: String.t()
  def play() do
    ai_answer = Enum.random(["rock", "paper", "scissors"])
    answer = String.trim(IO.gets("Choose rock, paper, or scissors: "))

    cond do
      answer == ai_answer ->
        IO.puts("It's a tie!")
        Games.main([])

      beats?(answer, ai_answer) ->
        ScoreTracker.add_points(10)
        IO.puts("You win! #{answer} beats #{ai_answer}.")
        Games.main([])

      true ->
        IO.puts("You lose! #{ai_answer} beats #{answer}.")
        Games.main([])
    end
  end

  @spec beats?(String.t(), String.t()) :: boolean()
  defp beats?(player_answer, ai_answer) do
    {player_answer, ai_answer} in [
      {"rock", "scissors"},
      {"scissors", "paper"},
      {"paper", "rock"}
    ]
  end
end
