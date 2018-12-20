defmodule AcordesWeb.ArtistControllerTest do
  use AcordesWeb.ConnCase

  describe "index" do
    test "lists all artists", %{conn: conn} do
      conn = get(conn, Routes.artist_path(conn, :index))
      assert html_response(conn, 200) =~ "Artistas"
    end
  end
end
