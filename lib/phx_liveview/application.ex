defmodule PhxLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxLiveviewWeb.Telemetry,
      PhxLiveview.Repo,
      {DNSCluster, query: Application.get_env(:phx_liveview, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxLiveview.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxLiveview.Finch},
      # Start a worker by calling: PhxLiveview.Worker.start_link(arg)
      # {PhxLiveview.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxLiveviewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
