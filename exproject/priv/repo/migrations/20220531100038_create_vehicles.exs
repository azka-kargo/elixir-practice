defmodule Exproject.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :vehicle_plate, :string
      add :status, :boolean, default: false, null: false
      add :vehicle_id, : string

      timestamps()
    end
  end
end
