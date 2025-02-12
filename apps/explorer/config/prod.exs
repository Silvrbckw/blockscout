import Config

# Configures the database
config :explorer, Explorer.Repo.Local,
  prepare: :unnamed,
  timeout: :timer.seconds(60),
  migration_lock: nil,
  telemetry_prefix: [:explorer, :repo]

# Configures API the database
config :explorer, Explorer.Repo.Replica1,
  prepare: :unnamed,
  timeout: :timer.seconds(60),
  telemetry_prefix: [:explorer, :repo]

# Configures Account database
config :explorer, Explorer.Repo.Account,
  prepare: :unnamed,
  timeout: :timer.seconds(60),
  telemetry_prefix: [:explorer, :repo]

config :explorer, Explorer.Tracer, env: "production", disabled?: true

config :logger, :explorer,
  level: :info,
  path: Path.absname("logs/prod/explorer.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :reading_token_functions,
  level: :debug,
  path: Path.absname("logs/prod/explorer/tokens/reading_functions.log"),
  metadata_filter: [fetcher: :token_functions],
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :token_instances,
  level: :debug,
  path: Path.absname("logs/prod/explorer/tokens/token_instances.log"),
  metadata_filter: [fetcher: :token_instances],
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :explorer, Explorer.Celo.CoreContracts, enabled: true, refresh: :timer.hours(1), refresh_concurrency: 5
config :explorer, Explorer.Celo.AddressCache, Explorer.Celo.CoreContracts

config :explorer, Explorer.Chain.Events.Listener, event_source: Explorer.Chain.Events.PubSubSource
