defmodule PhxLiveview.Repo do
  use Ecto.Repo,
    otp_app: :phx_liveview,
    adapter: Ecto.Adapters.Postgres
end
