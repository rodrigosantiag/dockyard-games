defmodule Games.ScoreTracker do
  @moduledoc """
  A module to keep track of scores for a player.
  """

  use GenServer

  @doc """
  Starts the score tracker.
  """
  @spec start_link(any()) :: {:ok, pid()} | {:error, term()}
  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Adds points to the score.
  """
  @spec add_points(5 | 10 | 25) :: :ok
  def add_points(points) do
    GenServer.cast(__MODULE__, {:add_points, points})
  end

  @doc """
  Returns the current score.
  """
  @spec current_score() :: integer()
  def current_score do
    GenServer.call(__MODULE__, :get_score)
  end

  @impl true
  def init(_args) do
    {:ok, 0}
  end

  @impl true
  def handle_cast({:add_points, points}, state) do
    new_state = state + points
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:get_score, _from, state) do
    {:reply, state, state}
  end
end
