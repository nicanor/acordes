defmodule Acordes.HubTest do
  use Acordes.DataCase

  alias Acordes.Hub

  describe "artists" do
    alias Acordes.Hub.Artist

    @valid_attrs %{bio: "some bio", bio_source: "some bio_source", name: "some name", slug: "some slug"}
    @update_attrs %{bio: "some updated bio", bio_source: "some updated bio_source", name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{bio: nil, bio_source: nil, name: nil, slug: nil}

    def artist_fixture(attrs \\ %{}) do
      {:ok, artist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hub.create_artist()

      artist
    end

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Hub.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Hub.get_artist!(artist.id) == artist
    end
  end
end
