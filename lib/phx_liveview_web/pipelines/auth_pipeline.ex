defmodule PhxLiveviewWeb.Pipeline.Auth do
  @moduledoc """
  Pipeline module for Guardian authentication in the PhxLiveviewWeb application.
  """

  use Guardian.Plug.Pipeline,
    otp_app: :phx_liveview,
    module: PhxLiveviewWeb.Pipeline.Guardian,
    error_handler: PhxLiveviewWeb.Pipeline.ErrorHandler

  plug Guardian.Plug.VerifyHeader, header_name: "authentication"
  plug Guardian.Plug.EnsureAuthenticated, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
