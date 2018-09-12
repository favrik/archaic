defmodule Archaic.Bookmark.URL do
  use Ecto.Schema
  import Ecto.Changeset


  schema "urls" do
    field :description, :string
    field :screenshot, :string
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url, :title, :description, :screenshot])
    |> validate_required([:url, :title, :description, :screenshot])
    |> unique_constraint(:url)
    |> unique_constraint(:title)
    |> unique_constraint(:description)
  end
end
