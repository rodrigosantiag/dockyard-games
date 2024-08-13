defmodule Games.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Games.ScoreTracker
    ]

    opts = [strategy: :one_for_one, name: Games.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
