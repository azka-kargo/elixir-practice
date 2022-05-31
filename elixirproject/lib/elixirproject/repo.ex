defmodule Elixirproject.Repo do
  use Ecto.Repo,
    otp_app: :elixirproject,
    adapter: Ecto.Adapters.Postgres
end
