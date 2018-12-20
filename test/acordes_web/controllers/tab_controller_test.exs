defmodule AcordesWeb.TabControllerTest do
  use AcordesWeb.ConnCase

  describe "index" do
    test "lists all tabs", %{conn: conn} do
      conn = get(conn, Routes.tab_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tabs"
    end
  end
end
