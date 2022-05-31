defmodule ExprojectWeb.VehicleView do
  use ExprojectWeb, :view
  alias ExprojectWeb.VehicleView

  def render("index.json", %{vehicles: vehicles}) do
    %{data: render_many(vehicles, VehicleView, "vehicle.json")}
  end

  def render("show.json", %{vehicle: vehicle}) do
    %{data: render_one(vehicle, VehicleView, "vehicle.json")}
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    %{
      id: vehicle.id,
      vehicle_plate: vehicle.vehicle_plate,
      status: vehicle.status
    }
  end
end
