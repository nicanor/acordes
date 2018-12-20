defmodule AcordesWeb.Router do
  use AcordesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", AcordesWeb do
    pipe_through :browser

    resources "/artistas", ArtistController, only: [:index, :show] do
      # get "/:slug", TabController, :show
    end

    resources "/tabs", TabController

    get "/", HomeController, :index
  end
end