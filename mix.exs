defmodule FastSyndication.MixProject do
  use Mix.Project

  @source_url "https://github.com/mikhailbot/fast_syndication"
  @version "0.1.0"

  def project do
    [
      app: :fast_syndication,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # hex
      description: "Fast Elixir RSS and Atom feed parser",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.25.0"}
    ]
  end

  defp package() do
    [
      files: [
        "lib",
        "native/fastsyndication/.cargo",
        "native/fastsyndication/src",
        "native/fastsyndication/Cargo.toml",
        "native/fastsyndication/Cargo.lock",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Mikhail Delport"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => "#{@source_url}/blob/master/CHANGELOG.md",
        "GitHub" => @source_url
      }
    ]
  end
end
