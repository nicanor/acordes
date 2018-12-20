defmodule AcordesWeb.ArtistControllerTest do
  use AcordesWeb.ConnCase

  alias Acordes.Hub

  @create_attrs %{bio: "some bio", bio_source: "some bio_source", name: "some name", slug: "some slug"}
  @update_attrs %{bio: "some updated bio", bio_source: "some updated bio_source", name: "some updated name", slug: "some updated slug"}
  @invalid_attrs %{bio: nil, bio_source: nil, name: nil, slug: nil}

  def fixture(:artist) do
    {:ok, artist} = Hub.create_artist(@create_attrs)
    artist
  end

  describe "index" do
    test "lists all artists", %{conn: conn} do
      conn = get(conn, Routes.artist_path(conn, :index))
      assert html_response(conn, 200) =~ "Artistas"
    end
  end

  defp create_artist(_) do
    artist = fixture(:artist)
    {:ok, artist: artist}
  end
end
