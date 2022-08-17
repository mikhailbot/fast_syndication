# FastSyndication

Minimal wrapper around Rust NIFs for fast RSS and Atom feed parsing

## Usage

```elixir
iex(1)>  {:ok, map_of_rss} = FastRSS.parse(%{rss_string: "...rss_feed_string..."})
iex(2)>  {:ok, map_of_atom} = FastRSS.parse(%{atom_string: "...rss_feed_string..."})
```
