defmodule Exproject.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exproject.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        status: true,
        vehicle_plate: "some vehicle_plate"
      })
      |> Exproject.Vehicles.create_vehicle()

    vehicle
  end
end
