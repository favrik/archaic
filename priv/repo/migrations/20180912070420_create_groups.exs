defmodule Archaic.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :path, {:array, :integer}, null: false

      timestamps()
    end

    create unique_index(:groups, [:name])
  end
end
