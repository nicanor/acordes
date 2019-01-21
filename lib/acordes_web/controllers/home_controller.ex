defmodule AcordesWeb.HomeController do
  use AcordesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def suggestions(conn, %{"input" => input}) do
    suggestions = Acordes.Hub.FuzzyFilter.get(input)
    render(conn, "suggestions.json", suggestions: suggestions)
  end
end
