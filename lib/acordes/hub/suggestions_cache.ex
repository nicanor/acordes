defmodule Acordes.Hub.SuggestionsCache do
  use GenServer
  alias Acordes.Hub

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def search(term) do
    term = normalize(term)

    Acordes.Hub.SuggestionsCache.get()
    |> Stream.filter(fn {n, _} -> n =~ term end)
    |> Stream.map(fn {_normalized_name, name_and_url} -> name_and_url end)
    |> Enum.take(10)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  # GenServer callbacks

  def handle_call(:get, _from, set) do
    {:reply, set, set}
  end

  def init(_args) do
    artists =
      Hub.list_artists()
      |> Enum.map(fn %{name: name, slug: slug} ->
        {normalize(name), [name, slug]}
      end)

    tabs =
      Hub.list_tabs()
      |> Enum.map(fn %{title: title, slug: tab_slug, artist: %{name: name, slug: artist_slug}} ->
        {normalize("#{title} #{name}"), ["#{title}, #{name}", "#{artist_slug}/#{tab_slug}"]}
      end)

    {:ok, artists ++ tabs}
  end

  defp normalize(complete_name) do
    complete_name
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-z\s]/u, "")
    |> String.downcase()
  end
end
