defmodule RumblWeb.WatchView do
  use RumblWeb, :view

  def player_id(%{url: video_url}) do
    ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}
    |> Regex.named_captures(video_url)
    |> get_in(["id"])
  end
end
