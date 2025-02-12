defmodule EventStream.PageLiveTest do
  use EventStream.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to EventStream!"
    assert render(page_live) =~ "Welcome to EventStream!"
  end
end
