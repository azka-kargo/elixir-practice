defmodule ExprojectWeb.Transporter_VehicleController do
  use ExprojectWeb, :controller

  alias Exproject.Transporter_vehicles
  alias Exproject.Transporter_vehicles.Transporter_Vehicle

  action_fallback ExprojectWeb.FallbackController

  def index(conn, _params) do
    transporter_vehicle = Transporter_vehicles.list_transporter_vehicle()
    render(conn, "index.json", transporter_vehicle: transporter_vehicle)
  end

  def create(conn, %{"transporter__vehicle" => transporter__vehicle_params}) do
    with {:ok, %Transporter_Vehicle{} = transporter__vehicle} <- Transporter_vehicles.create_transporter__vehicle(transporter__vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter__vehicle_path(conn, :show, transporter__vehicle))
      |> render("show.json", transporter__vehicle: transporter__vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter__vehicle = Transporter_vehicles.get_transporter__vehicle!(id)
    render(conn, "show.json", transporter__vehicle: transporter__vehicle)
  end

  def update(conn, %{"id" => id, "transporter__vehicle" => transporter__vehicle_params}) do
    transporter__vehicle = Transporter_vehicles.get_transporter__vehicle!(id)

    with {:ok, %Transporter_Vehicle{} = transporter__vehicle} <- Transporter_vehicles.update_transporter__vehicle(transporter__vehicle, transporter__vehicle_params) do
      render(conn, "show.json", transporter__vehicle: transporter__vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter__vehicle = Transporter_vehicles.get_transporter__vehicle!(id)

    with {:ok, %Transporter_Vehicle{}} <- Transporter_vehicles.delete_transporter__vehicle(transporter__vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
