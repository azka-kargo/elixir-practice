defmodule Exproject.Transporter_vehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exproject.Transporter_vehicles` context.
  """

  @doc """
  Generate a transporter__vehicle.
  """
  def transporter__vehicle_fixture(attrs \\ %{}) do
    {:ok, transporter__vehicle} =
      attrs
      |> Enum.into(%{

      })
      |> Exproject.Transporter_vehicles.create_transporter__vehicle()

    transporter__vehicle
  end
end
