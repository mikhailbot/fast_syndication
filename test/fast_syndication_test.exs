defmodule FastSyndicationTest do
  use ExUnit.Case
  doctest FastSyndication

  test "parsing atom feed" do
    assert :ok == FastSyndication.parse(%{atom_string: atom()}) |> elem(0)
  end

  test "parsing rss feed" do
    assert :ok = FastSyndication.parse(%{rss_string: rss()}) |> elem(0)
  end

  defp atom() do
    """
      <?xml version=\"1.0\"?>\n<feed xmlns=\"http://www.w3.org/2005/Atom\"><title>My Blog</title><id></id><updated>1970-01-01T00:00:00+00:00</updated><author><name>N. Blogger</name></author><entry><title>My first post!</title><id></id><updated>1970-01-01T00:00:00+00:00</updated><content>This is my first post</content></entry></feed>
    """
  end

  defp rss() do
    """
      <?xml version=\"1.0\" encoding=\"utf-8\"?><rss version=\"2.0\"><channel><title>My Blog</title><link>http://myblog.com</link><description>Where I write stuff</description><item><title>My first post!</title><link>http://myblog.com/post1</link><description><![CDATA[This is my first post]]></description></item></channel></rss>
    """
  end
end
