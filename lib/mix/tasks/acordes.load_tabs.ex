defmodule Mix.Tasks.Acordes.LoadTabs do
  use Mix.Task

  @shortdoc "Load tabs information from acordestotales.com"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.Task.run("app.start")
    Mix.shell().info("Now I'll load all tabs from acordestotales.com and save in the database!")

    artists = Acordes.Hub.list_artists()

    HTTPoison.start()

    artists
    |> Enum.each(fn %{id: id, slug: slug} -> load_artist(id, slug) end)
  end

  defp load_artist(id, slug) do
    Mix.shell().info("Loading artist #{id}: #{slug}")

    url = "http://acordestotales.com/api/artists/#{slug}"
    {:ok, response} = HTTPoison.get(url)
    {:ok, body} = Jason.decode(response.body)

    body["tabs"]
    |> Task.async_stream(
      fn %{"title" => tab_title, "url" => tab_url} -> load_tab(id, tab_title, tab_url) end,
      timeout: 20000
    )
    |> Stream.run()
  end

  defp load_tab(id, title, url) do
    slug = url |> String.split("/") |> List.last()

    case Acordes.Hub.get_tab(id, slug) do
      nil ->
        Mix.shell().info("-Tab URL: #{url}")

        {:ok, response} = HTTPoison.get("http://acordestotales.com/#{url}")
        {:ok, body} = Jason.decode(response.body)

        Acordes.Hub.create_tab(%{
          title: title,
          slug: slug,
          content: body["content"],
          artist_id: id
        })

      _ ->
        nil
    end
  end
end
