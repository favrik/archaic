defmodule ArchaicWeb.URLController do
  use ArchaicWeb, :controller

  alias Archaic.Bookmark
  alias Archaic.Bookmark.URL

  action_fallback ArchaicWeb.FallbackController

  def index(conn, _params) do
    urls = Bookmark.list_urls()
    render(conn, "index.json", urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    with {:ok, %URL{} = url} <- Bookmark.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Bookmark.url_path(conn, :show, url))
      |> render("show.json", url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Bookmark.get_url!(id)
    render(conn, "show.json", url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Bookmark.get_url!(id)

    with {:ok, %URL{} = url} <- Bookmark.update_url(url, url_params) do
      render(conn, "show.json", url: url)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Bookmark.get_url!(id)
    with {:ok, %URL{}} <- Bookmark.delete_url(url) do
      send_resp(conn, :no_content, "")
    end
  end
end
