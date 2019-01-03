defmodule Acordes.Hub.Tab do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tabs" do
    field :title, :string
    field :slug, :string
    field :content, :string

    belongs_to :artist, Acordes.Hub.Artist

    timestamps()
  end

  @doc false
  def changeset(tab, attrs) do
    tab
    |> cast(attrs, [:title, :slug, :content, :artist_id])
    |> validate_required([:title, :slug, :content, :artist_id])
  end
end

defimpl Phoenix.Param, for: Acordes.Hub.Tab do
  def to_param(%{slug: slug}), do: slug
end
