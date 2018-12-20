defmodule Acordes.Hub.Tab do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tabs" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :source, :string

    belongs_to :artist, Acordes.Hub.Artist

    timestamps()
  end

  @doc false
  def changeset(tab, attrs) do
    tab
    |> cast(attrs, [:title, :slug, :content, :source])
    |> validate_required([:title, :slug, :content, :source])
  end
end
