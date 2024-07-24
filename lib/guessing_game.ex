defmodule Games.GuessingGame do
  @moduledoc """
  Number guessing game
  """

  @doc """
  Play the game
  """
  @spec play() :: String.t()
  def play(), do: do_play(generate_number(), 5)

  @spec do_play(integer(), integer()) :: String.t()
  defp do_play(number, 0), do: "You lose! the answer was #{number}"

  defp do_play(number, max_attempts) do
    input_number = String.trim(IO.gets("Guess a number between 1 and 10: "))
    integer_number = String.to_integer(input_number)

    cond do
      integer_number < number ->
        IO.puts("Too Low!")
        do_play(number, max_attempts - 1)

      integer_number > number ->
        IO.puts("Too High!")
        do_play(number, max_attempts - 1)

      true ->
        "Correct!"
    end
  end

  @spec generate_number() :: integer()
  defp generate_number do
    Enum.random(1..10)
  end
end
