defmodule AcordesWeb.HomeController do
  use AcordesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def suggestions(conn, %{"input" => input}) do
    render(conn, "suggestions.json", input: input)
  end
end
