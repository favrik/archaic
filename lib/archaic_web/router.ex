defmodule ArchaicWeb.Router do
  use ArchaicWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ArchaicWeb do
    pipe_through :api
  end
end
