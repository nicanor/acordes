defmodule Acordes.Hub.FuzzyFilter do
  import Ecto.Query, warn: false
  alias Acordes.Repo

  @file_path Path.join(File.cwd!(), "priv/repo/search_terms.txt")

  def get2(term) do
    # "to_tsvector('spanish', name) @@ plainto_tsquery('spanish', :q)"

    Repo.all(
      from a in Acordes.Hub.Artist,
        where:
          fragment(
            "to_tsvector('spanish', ?) @@ plainto_tsquery('spanish', ?)",
            a.name,
            ^(term <> ":*")
          ),
        select: a.name
    )
  end

  def get(term) do
    "cat #{@file_path} | fzf --filter=\"#{term}\""
    |> String.to_charlist()
    |> :os.cmd()
    |> List.to_string()
    |> String.split("\n", trim: true)
    |> Stream.take(200)
    |> Enum.map(&split/1)
  end

  def split(term) do
    String.split(term, ";")
  end
end
