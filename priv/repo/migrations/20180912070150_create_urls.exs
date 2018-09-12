defmodule Archaic.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string
      add :title, :string
      add :description, :string
      add :screenshot, :string

      timestamps()
    end

    create unique_index(:urls, [:url])
    create unique_index(:urls, [:title])
    create unique_index(:urls, [:description])
  end
end
