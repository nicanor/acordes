defmodule AcordesWeb.HomeView do
  use AcordesWeb, :view

  def render("suggestions.json", %{suggestions: suggestions}) do
    #artists = Acordes.Hub.list_artists()
    #tabs = Acordes.Hub.list_tabs(input, limit: 100)
    #suggestions = Enum.map(artists, fn artist -> %{label: artist.name, value: artist.slug} end) ++
    #              Enum.map(tabs, fn tab -> %{label: tab.title <> " - " <> tab.artist.name, value: tab.artist.slug <> "/" <> tab.slug} end)
    %{suggestions: suggestions}
  end
end
