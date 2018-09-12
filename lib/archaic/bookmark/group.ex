defmodule Archaic.Bookmark.Group do
  use Ecto.Schema
  import Ecto.Changeset

  use EctoMaterializedPath

  schema "groups" do
    field :name, :string
    field :path, EctoMaterializedPath.Path, default: [] # default is important here

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
