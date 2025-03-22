defmodule PhxLiveviewWeb.Live.Home.Index do
  @moduledoc """
    Home LiveView
  """

  use PhxLiveviewWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
