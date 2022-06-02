defmodule Exproject.Transporters.Transporter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporter" do
    field :name, :string
    field :npwp, :string
    field :phone_number, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(transporter, attrs) do
    transporter
    |> cast(attrs, [:name, :phone_number, :npwp, :status])
    |> validate_required([:name, :phone_number, :npwp, :status])
  end
end
