defmodule Acordes.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :slug, :string
      add :bio, :text
      add :bio_source, :string

      timestamps()
    end
  end
end
