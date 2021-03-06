defmodule Acordes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Acordes.Repo,
      # Start the endpoint when the application starts
      AcordesWeb.Endpoint,
      # Starts a worker by calling: Acordes.Worker.start_link(arg)
      Acordes.Hub.ArtistsCache,
      Acordes.Hub.SuggestionsCache
      # {Acordes.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Acordes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AcordesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
