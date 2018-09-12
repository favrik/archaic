defmodule ArchaicWeb.URLView do
  use ArchaicWeb, :view
  alias ArchaicWeb.URLView

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, URLView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, URLView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{id: url.id,
      url: url.url,
      title: url.title,
      description: url.description,
      screenshot: url.screenshot}
  end
end
