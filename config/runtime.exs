import Config

api_token = System.get_env("LEAGUE_TOKEN") || "TokenHERE"
default_region_endpoint = System.get_env("DEFAULT_REGION_ENDPOINT") || "BR"

config :zaun_ex, Zaun, api_token: api_token, default_region_endpoint: default_region_endpoint
