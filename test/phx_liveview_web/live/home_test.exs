defmodule PhxLiveviewWeb.Test.Live.Home do
  use PhxLiveviewWeb.ConnCase
  import Phoenix.LiveViewTest

  test "GET / renders correctly", %{conn: conn} do
    conn = get(conn, ~p"/")
    response = html_response(conn, 200)

    assert response =~ "Peace of mind from prototype to production"
  end
end
