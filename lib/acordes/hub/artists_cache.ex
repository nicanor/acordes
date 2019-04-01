defmodule Acordes.Hub.ArtistsCache do
  use GenServer
  alias Acordes.Hub

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  def add(artist) do
    GenServer.call(__MODULE__, {:add, artist})
  end

  def remove(artist) do
    GenServer.call(__MODULE__, {:remove, artist})
  end

  # GenServer callbacks
  def handle_call(:get, _from, set) do
    {:reply, set, set}
  end

  def handle_call({:add, artist}, _from, set) do
    new_set = MapSet.put(set, artist)
    {:reply, new_set, new_set}
  end

  def handle_call({:remove, artist}, _from, set) do
    new_set = MapSet.delete(set, artist)
    {:reply, new_set, new_set}
  end

  def init(_args) do
    artists = Enum.take(Hub.list_artists(), 10)
    {:ok, MapSet.new(artists)}
  end
end
