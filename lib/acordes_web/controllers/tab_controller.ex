defmodule AcordesWeb.TabController do
  use AcordesWeb, :controller

  alias Acordes.Hub
  alias Acordes.Hub.Tab

  def index(conn, _params) do
    tabs = Hub.list_tabs()
    render(conn, "index.html", tabs: tabs)
  end

  def show(conn, %{"id" => id}) do
    tab = Hub.get_tab!(id)
    render(conn, "show.html", tab: tab)
  end
end
