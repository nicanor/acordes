defmodule Acordes.HubTest do
  use Acordes.DataCase

  alias Acordes.Hub

  describe "artists" do
    @valid_attrs %{
      bio: "some bio",
      bio_source: "some bio_source",
      name: "some name",
      slug: "some slug"
    }

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
      assert Hub.get_artist!(artist.slug) == artist
    end
  end

  describe "tabs" do
    @valid_attrs %{
      content: "some content",
      slug: "some slug",
      source: "some source",
      title: "some title",
      artist_id: nil
    }

    def tab_fixture do
      artist = artist_fixture()

      attrs = %{@valid_attrs | artist_id: artist.id}

      {:ok, tab} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hub.create_tab()

      tab
    end

    test "list_tabs/0 returns all tabs" do
      tab = tab_fixture()
      assert Hub.list_tabs() == [tab]
    end

    test "get_tab!/1 returns the tab with given id" do
      tab = tab_fixture()
      assert Hub.get_tab!(tab.slug) == tab
    end
  end
end
