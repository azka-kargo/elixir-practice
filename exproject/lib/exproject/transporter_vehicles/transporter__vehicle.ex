defmodule Exproject.Transporter_vehicles.Transporter_Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporter_vehicle" do


    timestamps()
  end

  @doc false
  def changeset(transporter__vehicle, attrs) do
    transporter__vehicle
    |> cast(attrs, [])
    |> validate_required([])
  end
end
