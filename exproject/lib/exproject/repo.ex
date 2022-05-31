defmodule Exproject.Repo do
  use Ecto.Repo,
    otp_app: :exproject,
    adapter: Ecto.Adapters.Postgres
end
