defmodule Auth.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :auth,
    module: Auth.Guardian,
    error_handler: Auth.AuthErrorHandler
  
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end