defmodule ZaunTest do
  use ExUnit.Case
  doctest Zaun

  test "greets the world" do
    assert Zaun.hello() == :world
  end
end
