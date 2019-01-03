defmodule Acordes.Hub.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end

defimpl Phoenix.Param, for: Acordes.Hub.Artist do
  def to_param(%{slug: slug}), do: slug
end
