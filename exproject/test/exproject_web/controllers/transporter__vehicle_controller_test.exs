defmodule ExprojectWeb.Transporter_VehicleControllerTest do
  use ExprojectWeb.ConnCase

  import Exproject.Transporter_vehiclesFixtures

  alias Exproject.Transporter_vehicles.Transporter_Vehicle

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transporter_vehicle", %{conn: conn} do
      conn = get(conn, Routes.transporter__vehicle_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transporter__vehicle" do
    test "renders transporter__vehicle when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transporter__vehicle_path(conn, :create), transporter__vehicle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transporter__vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transporter__vehicle_path(conn, :create), transporter__vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transporter__vehicle" do
    setup [:create_transporter__vehicle]

    test "renders transporter__vehicle when data is valid", %{conn: conn, transporter__vehicle: %Transporter_Vehicle{id: id} = transporter__vehicle} do
      conn = put(conn, Routes.transporter__vehicle_path(conn, :update, transporter__vehicle), transporter__vehicle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transporter__vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transporter__vehicle: transporter__vehicle} do
      conn = put(conn, Routes.transporter__vehicle_path(conn, :update, transporter__vehicle), transporter__vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transporter__vehicle" do
    setup [:create_transporter__vehicle]

    test "deletes chosen transporter__vehicle", %{conn: conn, transporter__vehicle: transporter__vehicle} do
      conn = delete(conn, Routes.transporter__vehicle_path(conn, :delete, transporter__vehicle))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transporter__vehicle_path(conn, :show, transporter__vehicle))
      end
    end
  end

  defp create_transporter__vehicle(_) do
    transporter__vehicle = transporter__vehicle_fixture()
    %{transporter__vehicle: transporter__vehicle}
  end
end
