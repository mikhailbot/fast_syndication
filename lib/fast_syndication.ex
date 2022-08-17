defmodule FastSyndication do
  defmodule Native do
    use Rustler, otp_app: :fast_syndication, crate: "fastsyndication"

    def parse_atom(_a), do: :erlang.nif_error(:nif_not_loaded)
    def parse_rss(_a), do: :erlang.nif_error(:nif_not_loaded)
  end

  def parse(""), do: {:error, "Cannot parse blank string"}

  def parse(%{atom_string: atom_string}) when is_binary(atom_string) do
    atom_string
    |> Native.parse_atom()
    |> map_to_tuple()
  end

  def parse(%{rss_string: rss_string}) when is_binary(rss_string) do
    rss_string
    |> Native.parse_rss()
    |> map_to_tuple()
  end

  def parse(_somethig_else), do: {:error, "RSS feed must be passed in as a string"}

  defp map_to_tuple(%{"Ok" => map}), do: {:ok, map}
  defp map_to_tuple({:ok, map}), do: {:ok, map}
  defp map_to_tuple(%{"Err" => msg}), do: {:error, msg}
  defp map_to_tuple({:error, msg}), do: {:error, msg}
end
