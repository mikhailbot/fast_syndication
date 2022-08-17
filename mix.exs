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
      docs: docs(),
      description: description(),
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
      {:rustler, "~> 0.25.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp docs() do
    [
      main: "readme",
      markdown_processor: ExDoc.Markdown.Earmark,
      extras: ["README.md", "CHANGELOG.md"],
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  defp description() do
    "Minimal wrapper around Rust NIFs for fast RSS and Atom feed parsing."
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
