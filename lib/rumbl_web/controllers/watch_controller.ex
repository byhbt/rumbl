defmodule RumblWeb.WatchController do
  use RumblWeb, :controller

  alias Rumbl.Multimedia

  def show(conn, %{"id" => video_slug}) do
    video = Multimedia.get_video!(video_slug)

    render conn, "show.html", video: video
  end
end
