defmodule AcordesWeb.TabController do
  use AcordesWeb, :controller

  alias Acordes.Hub
  alias Acordes.Hub.Tab

  def index(conn, _params) do
    tabs = Hub.list_tabs()
    render(conn, "index.html", tabs: tabs)
  end

  def show(conn, %{"artist_id" => artist_slug, "id" => tab_slug}) do
    artist = Hub.get_artist_by_slug!(artist_slug)
    tab = Hub.get_tab_by_artist_and_slug!(artist, tab_slug)
    render(conn, "show.html", artist: artist, tab: tab)
  end
end
