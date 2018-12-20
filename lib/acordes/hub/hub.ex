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

  alias Acordes.Hub.Tab

  @doc """
  Returns the list of tabs.
  """
  def list_tabs do
    Repo.all(Tab)
  end

  @doc """
  Gets a single tab.

  Raises `Ecto.NoResultsError` if the Tab does not exist.

  ## Examples
  """
  def get_tab!(id), do: Repo.get!(Tab, id)

  @doc """
  Creates a tab.

  ## Examples

      iex> create_tab(%{field: value})
      {:ok, %Tab{}}

      iex> create_tab(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tab(attrs \\ %{}) do
    %Tab{}
    |> Tab.changeset(attrs)
    |> Repo.insert()
  end
end
