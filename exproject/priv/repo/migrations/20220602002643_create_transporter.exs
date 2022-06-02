defmodule Exproject.Repo.Migrations.CreateTransporter do
  use Ecto.Migration

  def change do
    create table(:transporter) do
      add :name, :string
      add :phone_number, :string
      add :npwp, :string
      add :status, :string
      add :transporter_id, :string


      timestamps()
    end
  end
end
