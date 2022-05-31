defmodule Exproject.Repo.Migrations.CreateTransporter do
  use Ecto.Migration

  def change do
    create table(:transporter) do
      add :vehicle_plate, :string
      add :status, :boolean, default: false, null: false
      add :vehicle_id, references("vehicles")


      timestamps()
    end
  end
end
