defmodule Mix.Tasks.Acordes.LoadArtists do
  use Mix.Task

  @shortdoc "Load information from acordestotales.com"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.Task.run("app.start")

    Mix.shell().info(
      "Now I'll load all artists from acordestotales.com and save in the database!"
    )

    HTTPoison.start()
    {:ok, response} = HTTPoison.get("http://acordestotales.com/api/artists")
    {:ok, body} = Jason.decode(response.body)

    Enum.each(body, fn %{"name" => name, "url" => url} ->
      slug = String.slice(url, 13..9999)
      Acordes.Hub.create_artist(%{name: name, slug: slug})
    end)
  end
end
