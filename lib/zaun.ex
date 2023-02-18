defmodule Zaun do
  alias Zaun.ApiClient

  @moduledoc """
  Documentation for `Zaun`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Zaun.hello()
      :world

  """

  def get_summoner_by_name(summoner_name, config \\ []) do
    ApiClient.summoner_by_name(summoner_name, config)
  end

  def hello do
    :world
  end
end
