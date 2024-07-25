defmodule Games.Wordle do
  @moduledoc """
  Wordle game
  """

  @max_attempts 6

  @doc """
  Play the game
  """
  @spec play() :: :ok
  def play, do: do_play(@max_attempts, pick_word())

  defp do_play(0, word), do: IO.puts("You lose! Word was #{word}")

  defp do_play(attempt, word) do
    guess = IO.gets("Enter a five letter word: ") |> String.trim()

    result = feedback(word, guess)

    if all_green?(result) do
      IO.puts("You win! Word was #{word}")
    else
      IO.puts("Feedback: #{Enum.join(result, ", ")}")
      do_play(attempt - 1, word)
    end
  end

  @doc """
  Give feedback on the guess

  ## Examples

    iex> Games.Wordle.feedback("toast", "toast")
    [:green, :green, :green, :green, :green]

    iex> Games.Wordle.feedback("toast", "tarts")
    [:green, :yellow, :grey, :yellow, :yellow]

    iex> Games.Wordle.feedback("toast", "hellz")
    [:grey, :grey, :grey, :grey, :grey]
  """
  @spec feedback(String.t(), String.t()) :: [String.t()]
  def feedback(word, guess) do
    word_letters = String.graphemes(word)
    guess_letters = String.graphemes(guess)

    word_letters
    |> Enum.zip(guess_letters)
    |> Enum.map(fn {w, g} ->
      cond do
        w == g -> :green
        g in word_letters -> :yellow
        true -> :grey
      end
    end)
  end

  @spec pick_word() :: String.t()
  defp pick_word do
    Enum.random(["toast", "tarts", "hello", "beats"])
  end

  @spec all_green?([String.t()]) :: boolean()
  defp all_green?(result) do
    Enum.all?(result, fn x -> x == :green end)
  end
end
