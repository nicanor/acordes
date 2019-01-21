defmodule Acordes.Hub.FuzzyFilter do

  @file_path 'priv/repo/search_terms.txt'

  def get(term) do
    "cat #{@file_path} | fzf --filter=\"#{term}\""
    |> String.to_charlist
    |> :os.cmd
    |> List.to_string()
    |> String.split("\n", trim: true)
    |> Stream.take(200)
    |> Enum.map(&split/1)
  end

  def split(term) do
    String.split(term, ";")
  end
end
