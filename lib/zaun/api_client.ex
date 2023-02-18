defmodule Zaun.ApiClient do
  # Region Endpoints
  @br_endpoint "https://br1.api.riotgames.com"
  @eune_endpoint "https://eun1.api.riotgames.com"
  @euw_endpoint "https://euw1.api.riotgames.com"
  @jp_endpoint "https://jp1.api.riotgames.com"
  @kr_endpoint "https://kr.api.riotgames.com"
  @la1_endpoint "https://la1.api.riotgames.com"
  @la2_endpoint "https://la2.api.riotgames.com"
  @na_endpoint "https://na1.api.riotgames.com"
  @oce_endpoint "https://oc1.api.riotgames.com"
  @tr_endpoint "https://tr1.api.riotgames.com"
  @ru_endpoint "https://ru.api.riotgames.com"
  @ph_endpoint "https://ph2.api.riotgames.com"
  @sg_endpoint "https://sg2.api.riotgames.com"
  @th_endpoint "https://th2.api.riotgames.com"
  @tw_endpoint "https://tw2.api.riotgames.com"
  @vn_endpoint "https://vn2.api.riotgames.com"
  # Other endpoints
  @summoner_endpoints "/lol/summoner/v4/summoners"

  def summoner_by_name(summoner_name, config \\ []) do
    config
    |> client()
    |> Tesla.get(@summoner_endpoints <> "/by-name/" <> summoner_name)
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp default_api_token() do
    Application.get_env(:zaun_ex, Zaun)[:api_token]
  end

  defp default_region_endpoint() do
    Application.get_env(:zaun_ex, Zaun)[:default_region_endpoint]
  end

  defp match_endpoint(endpoint) do
    case endpoint do
      "BR" -> @br_endpoint
      "EUNE" -> @eune_endpoint
      "EUW" -> @euw_endpoint
      "JP" -> @jp_endpoint
      "KR" -> @kr_endpoint
      "LA1" -> @la1_endpoint
      "LA2" -> @la2_endpoint
      "NA" -> @na_endpoint
      "OCE" -> @oce_endpoint
      "TR" -> @tr_endpoint
      "RU" -> @ru_endpoint
      "PH" -> @ph_endpoint
      "SG" -> @sg_endpoint
      "TH" -> @th_endpoint
      "TW" -> @tw_endpoint
      "VN" -> @vn_endpoint
    end
  end

  defp client(config) do
    api_token = Keyword.get(config, :api_token, default_api_token())

    endpoint =
      config
      |> Keyword.get(:api_token, default_region_endpoint())
      |> match_endpoint()

    middleware = [
      {Tesla.Middleware.BaseUrl, endpoint},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"X-Riot-Token", api_token}]}
    ]

    Tesla.client(middleware)
  end
end
