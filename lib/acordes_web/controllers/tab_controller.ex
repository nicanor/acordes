defmodule AcordesWeb.TabController do
  use AcordesWeb, :controller

  alias Acordes.Hub

  def show(conn, %{"artist_id" => artist_slug, "id" => tab_slug}) do
    artist = Hub.get_artist!(artist_slug)
    tab = Hub.get_tab!(artist, tab_slug)
    render(conn, "show.html", artist: artist, tab: tab)
  end
end
