defmodule Acordes.Repo do
  use Ecto.Repo,
    otp_app: :acordes,
    adapter: Ecto.Adapters.Postgres
end
