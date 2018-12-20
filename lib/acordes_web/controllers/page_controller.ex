defmodule AcordesWeb.PageController do
  use AcordesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
