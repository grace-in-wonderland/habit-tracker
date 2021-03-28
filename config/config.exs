# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :habit_tracker,
  ecto_repos: [HabitTracker.Repo]

# Configures the endpoint
config :habit_tracker, HabitTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uoN395w9aV86R+JS7meZbcJgXvO7OJgHy3JeyXxEn2qTp/dCAZj+0Syiof+Xmq5e",
  render_errors: [view: HabitTrackerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HabitTracker.PubSub,
  live_view: [signing_salt: "Q7HadZNZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
