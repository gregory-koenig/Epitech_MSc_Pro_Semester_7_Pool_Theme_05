# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth,
  ecto_repos: [Auth.Repo]

# Configures the endpoint
config :auth, AuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HFVy8kuzqDNf4BmrGZCX1MIpAfJbKk8T+kj8mBBLEJD1TdIgjbCIl5RxiEFNpNP2",
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Auth.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Guardian config
config :auth,Auth.Guardian,
       issuer: "auth",
       secret_key: "t+bWRwpf7/P5iUWm3Gk8aTeo9Q8iPOkzAnNGwI+E+Z5Bp2NObqn6JovkxrNWqapF"

config :plug, :validate_header_keys_during_test, true
