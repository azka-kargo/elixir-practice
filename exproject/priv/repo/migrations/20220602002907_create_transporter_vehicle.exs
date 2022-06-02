defmodule Exproject.Repo.Migrations.CreateTransporterVehicle do
  use Ecto.Migration

  def change do
    create table(:transporter_vehicle) do
      add :vehicle_id, references("vehicles")

      add :transporter_id, references("transporter")

      timestamps()
    end
  end
end
