defmodule AuthWeb.Router do
  use AuthWeb, :router
  alias Auth.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:8080/"]
    plug :accepts, ["json"]
  end
  pipeline :jwt_authenticated do
    plug  CORSPlug, [origin: "http://localhost:8080/"]
    plug Guardian.AuthPipeline
  end

  
  scope "/", AuthWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
  scope "/api/v1", AuthWeb do
    pipe_through :api # Use the default browser stack
    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api/v1", AuthWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthWeb do
  #   pipe_through :api
  # end
end
