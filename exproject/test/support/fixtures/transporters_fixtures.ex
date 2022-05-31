defmodule Exproject.TransportersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exproject.Transporters` context.
  """

  @doc """
  Generate a transporter.
  """
  def transporter_fixture(attrs \\ %{}) do
    {:ok, transporter} =
      attrs
      |> Enum.into(%{
        status: true,
        vehicle_plate: "some vehicle_plate"
      })
      |> Exproject.Transporters.create_transporter()

    transporter
  end
end
