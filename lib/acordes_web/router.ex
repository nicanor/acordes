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

    resources "/tabs", TabController, only: [:index]

    resources "/artistas", ArtistController, only: [:index, :show] do
      get "/:id", TabController, :show
    end

    get "/", HomeController, :index
  end
end
