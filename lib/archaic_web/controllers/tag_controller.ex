defmodule ArchaicWeb.TagController do
  use ArchaicWeb, :controller

  alias Archaic.Bookmark
  alias Archaic.Bookmark.Tag

  action_fallback ArchaicWeb.FallbackController

  def index(conn, _params) do
    tags = Bookmark.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Bookmark.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Bookmark.tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Bookmark.get_tag!(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Bookmark.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Bookmark.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Bookmark.get_tag!(id)
    with {:ok, %Tag{}} <- Bookmark.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
