defmodule ExprojectWeb.Transporter_VehicleView do
  use ExprojectWeb, :view
  alias ExprojectWeb.Transporter_VehicleView

  def render("index.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_many(transporter_vehicle, Transporter_VehicleView, "transporter__vehicle.json")}
  end

  def render("show.json", %{transporter__vehicle: transporter__vehicle}) do
    %{data: render_one(transporter__vehicle, Transporter_VehicleView, "transporter__vehicle.json")}
  end

  def render("transporter__vehicle.json", %{transporter__vehicle: transporter__vehicle}) do
    %{
      id: transporter__vehicle.id
    }
  end
end
