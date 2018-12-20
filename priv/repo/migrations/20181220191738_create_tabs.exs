defmodule Acordes.Repo.Migrations.CreateTabs do
  use Ecto.Migration

  def change do
    create table(:tabs) do
      add :title, :string
      add :slug, :string
      add :content, :text
      add :source, :string
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end

    create index(:tabs, [:artist_id])
  end
end
