defmodule Elixirfm.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixirfm,
      version: "0.1.5",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]],
      dialyzer: [plt_add_deps: :transitive],
      description: description(),
      preferred_cli_env: [
        vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
      ]
    ]
  end

  def description, do: "Lastfm API client for Elixir"

  def package do
    [
      name: :elixirfm,
      maintainers: ["Joshua Richardson"],
      licenses: ["MIT"],
      docs: [extras: ["README.md"]],
      links: %{"GitHub" => "https://github.com/jrichocean/Elixirfm"}
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [
        :logger,
        :httpoison
      ]
    ]
  end

  # Dependencies
  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.20.0", only: :dev},
      {:exvcr, "~> 0.10.0", only: :test},
      {:httpoison, "~> 1.5.1"},
      # {:inch_ex, "~> 0.5", only: [:dev, :test]},
      {:poison, "~> 4.0.0"},
    ]
  end
end
