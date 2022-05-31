defmodule Exproject.Transporters.Transporter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporter" do
    field :status, :boolean, default: false
    field :vehicle_plate, :string

    timestamps()
  end

  @doc false
  def changeset(transporter, attrs) do
    transporter
    |> cast(attrs, [:vehicle_plate, :status])
    |> validate_required([:vehicle_plate, :status])
  end
end
