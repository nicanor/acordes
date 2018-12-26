defmodule AcordesWeb.HomeView do
  use AcordesWeb, :view

  def render("suggestions.json", %{input: input}) do
    artists = Acordes.Hub.list_artists
    %{
      suggestions: artists |> Enum.map(fn artist -> %{label: artist.name, value: artist.slug} end)
    }
  end
end
