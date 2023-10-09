defmodule AlertsListener.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, port: 4000, plug: AlertsListener.Router}
    ]

    opts = [strategy: :one_for_one, name: AlertsListener.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
