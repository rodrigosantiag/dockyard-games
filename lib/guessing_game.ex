defmodule Games.GuessingGame do
  def play(), do: play(generate_number(), 5)
  def play(number, 0), do: "You lose! the answer was #{number}"

  def play(number, max_attempts) do
    input_number = String.trim(IO.gets("Guess a number between 1 and 10: "))
    integer_number = String.to_integer(input_number)

    cond do
      integer_number < number ->
        IO.puts("Too Low!")
        play(number, max_attempts - 1)

      integer_number > number ->
        IO.puts("Too High!")
        play(number, max_attempts - 1)

      true ->
        "Correct!"
    end
  end

  defp generate_number do
    Enum.random(1..10)
  end
end
