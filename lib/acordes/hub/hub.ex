defmodule Acordes.Hub do
  @moduledoc """
  The Hub context.
  """
  import Ecto.Query, warn: false
  alias Acordes.Repo
  alias Acordes.Hub.Artist
  alias Acordes.Hub.Tab

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
  def get_artist!(slug), do: Repo.get_by!(Artist, slug: slug)

  @doc """
  Returns the list of tabs.
  """
  def list_tabs do
    Repo.all(Tab)
  end

  def list_tabs(artist) do
    artist |> Ecto.assoc(:tabs) |> order_by(:title) |> Repo.all()
  end

  def list_tabs(input, limit: limit) do
    like = "%#{input}%"
    query = from t in Tab, where: ilike(t.title, ^like), preload: :artist, limit: ^limit
    Repo.all(query)
  end

  @doc """
  Gets a single tab.

  Raises `Ecto.NoResultsError` if the Tab does not exist.
  """
  def get_tab!(id), do: Repo.get_by!(Tab, slug: id)

  def get_tab!(artist, slug) do
    Repo.get_by!(Tab, artist_id: artist.id, slug: slug)
  end

  def get_tab(artist_id, slug) do
    Repo.get_by(Tab, artist_id: artist_id, slug: slug)
  end

  @doc """
  Creates an artist.
  """
  def create_artist(attrs \\ %{}) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a tab.
  """
  def create_tab(attrs \\ %{}) do
    %Tab{}
    |> Tab.changeset(attrs)
    |> Repo.insert()
  end
end
