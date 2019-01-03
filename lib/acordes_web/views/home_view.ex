defmodule AcordesWeb.HomeView do
  use AcordesWeb, :view

  def render("suggestions.json", %{input: input}) do
    artists = Acordes.Hub.list_artists()
    suggestions = Enum.map(fn artist -> %{label: artist.name, value: artist.slug} end)
    %{suggestions: suggestions}
  end
end
