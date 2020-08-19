# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :livepoll, LivepollWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Mlt7wRkzzggJQVttv4Maq7A02/+JjlQpuuI1lH3SkEyjMnjv1sLzWKIb9YFGFnpx",
  render_errors: [view: LivepollWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Livepoll.PubSub,
  live_view: [signing_salt: "mZDOa3xn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
