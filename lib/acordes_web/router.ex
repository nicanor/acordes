defmodule AcordesWeb.Router do
  use AcordesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Other scopes may use custom stacks.
  scope "/api", AcordesWeb do
    pipe_through :api
    get "/suggestions", HomeController, :suggestions
  end

  scope "/", AcordesWeb do
    pipe_through :browser

    resources "/artistas", ArtistController, only: [:index, :show] do
      get "/:id", TabController, :show
    end

    get "/", HomeController, :index
  end
end
