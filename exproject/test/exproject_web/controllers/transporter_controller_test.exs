defmodule ExprojectWeb.TransporterControllerTest do
  use ExprojectWeb.ConnCase

  import Exproject.TransportersFixtures

  alias Exproject.Transporters.Transporter

  @create_attrs %{
    status: true,
    vehicle_plate: "some vehicle_plate"
  }
  @update_attrs %{
    status: false,
    vehicle_plate: "some updated vehicle_plate"
  }
  @invalid_attrs %{status: nil, vehicle_plate: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transporter", %{conn: conn} do
      conn = get(conn, Routes.transporter_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transporter" do
    test "renders transporter when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transporter_path(conn, :create), transporter: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transporter_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => true,
               "vehicle_plate" => "some vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transporter_path(conn, :create), transporter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transporter" do
    setup [:create_transporter]

    test "renders transporter when data is valid", %{conn: conn, transporter: %Transporter{id: id} = transporter} do
      conn = put(conn, Routes.transporter_path(conn, :update, transporter), transporter: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transporter_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => false,
               "vehicle_plate" => "some updated vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transporter: transporter} do
      conn = put(conn, Routes.transporter_path(conn, :update, transporter), transporter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transporter" do
    setup [:create_transporter]

    test "deletes chosen transporter", %{conn: conn, transporter: transporter} do
      conn = delete(conn, Routes.transporter_path(conn, :delete, transporter))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transporter_path(conn, :show, transporter))
      end
    end
  end

  defp create_transporter(_) do
    transporter = transporter_fixture()
    %{transporter: transporter}
  end
end
