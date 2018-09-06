# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :archaic,
  ecto_repos: [Archaic.Repo]

# Configures the endpoint
config :archaic, ArchaicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Bxx1FLk9/vhLCz0quuWwGnOxZq/7Qx9D9rbHWKGHqUIYUebdCsHh/h4+9UF6G5hw",
  render_errors: [view: ArchaicWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Archaic.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
