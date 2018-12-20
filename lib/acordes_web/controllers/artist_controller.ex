defmodule AcordesWeb.ArtistController do
  use AcordesWeb, :controller

  alias Acordes.Hub
  alias Acordes.Hub.Artist

  def index(conn, _params) do
    artists = Hub.list_artists()
    render(conn, "index.html", artists: artists)
  end

  def show(conn, %{"id" => id}) do
    artist = Hub.get_artist!(id)
    render(conn, "show.html", artist: artist)
  end
end
