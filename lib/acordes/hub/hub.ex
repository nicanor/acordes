defmodule Acordes.Hub do
  @moduledoc """
  The Hub context.
  """

  import Ecto.Query, warn: false
  alias Acordes.Repo

  alias Acordes.Hub.Artist

  @doc """
  Returns the list of artists.
  """
  def list_artists do
    Repo.all(Artist)
  end

  @doc """
  Gets a single artist.
  Raises `Ecto.NoResultsError` if the Artist does not exist.
  """
  def get_artist!(id), do: Repo.get!(Artist, id)

  @doc """
  Creates an artist.
  """
  def create_artist(attrs \\ %{}) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end
end
