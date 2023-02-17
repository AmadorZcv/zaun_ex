defmodule Zaun.MixProject do
  use Mix.Project

  def project do
    [
      app: :zaun_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      description: "Riot League of Legends API wrapper",
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Zaun.Application, []}
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "zaun_ex",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/AmadorZcv/zaun_ex"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
