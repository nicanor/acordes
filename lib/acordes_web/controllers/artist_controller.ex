defmodule AcordesWeb.ArtistController do
  use AcordesWeb, :controller

  alias Acordes.Hub

  def index(conn, _params) do
    artists = Hub.list_artists()
    render(conn, "index.html", artists: artists)
  end

  def show(conn, %{"id" => id}) do
    artist = Hub.get_artist!(id)
    tabs = Hub.list_tabs(artist)
    render(conn, "show.html", artist: artist, tabs: tabs)
  end
end
