defmodule Exproject.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :status, :boolean, default: false
    field :vehicle_plate, :string

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:vehicle_plate, :status])
    |> validate_required([:vehicle_plate, :status])
  end
end
