defmodule ArchaicWeb.GroupController do
  use ArchaicWeb, :controller

  alias Archaic.Bookmark
  alias Archaic.Bookmark.Group

  action_fallback ArchaicWeb.FallbackController

  def index(conn, _params) do
    groups = Bookmark.list_groups()
    render(conn, "index.json", groups: groups)
  end

  def create(conn, %{"group" => group_params}) do
    with {:ok, %Group{} = group} <- Bookmark.create_group(group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Bookmark.group_path(conn, :show, group))
      |> render("show.json", group: group)
    end
  end

  def show(conn, %{"id" => id}) do
    group = Bookmark.get_group!(id)
    render(conn, "show.json", group: group)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = Bookmark.get_group!(id)

    with {:ok, %Group{} = group} <- Bookmark.update_group(group, group_params) do
      render(conn, "show.json", group: group)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = Bookmark.get_group!(id)
    with {:ok, %Group{}} <- Bookmark.delete_group(group) do
      send_resp(conn, :no_content, "")
    end
  end
end
