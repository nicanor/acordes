# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :acordes,
  ecto_repos: [Acordes.Repo]

# Configures the endpoint
config :acordes, AcordesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kyDdcvLKQ0bBn7W/lETadr364BX+4yIdplXipINGdOik4HJ2i5e1NA6p6GRHxVXK",
  render_errors: [view: AcordesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Acordes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
