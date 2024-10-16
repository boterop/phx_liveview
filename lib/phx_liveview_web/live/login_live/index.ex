defmodule PhxLiveviewWeb.LoginLive.Index do
  use PhxLiveviewWeb, :live_view

  alias PhxLiveview.Account

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("login", %{"email" => email, "password" => password}, socket) do
    with %{password: hash} = user <- Account.get_user_by_email!(email),
         true <- Bcrypt.verify_pass(password, hash) do
      {:noreply, assign(socket, current_user: user)}
    else
      _ ->
        {:noreply, assign(socket, error: "Invalid email or password")}
    end
  end
end
