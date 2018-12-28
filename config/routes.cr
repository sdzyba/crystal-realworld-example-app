Amber::Server.configure do
  pipeline :api do
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    # plug Amber::Pipe::CORS.new
  end

  routes :api, "/api" do
    # get "/user", UsersController, :show
    post "/users", UsersController, :create
    # post "/users/login", UserController, :login
    # put "/user", UserController, :update
  end
end
