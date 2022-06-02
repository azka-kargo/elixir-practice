defmodule Exproject.Transporter_vehiclesTest do
  use Exproject.DataCase

  alias Exproject.Transporter_vehicles

  describe "transporter_vehicle" do
    alias Exproject.Transporter_vehicles.Transporter_Vehicle

    import Exproject.Transporter_vehiclesFixtures

    @invalid_attrs %{}

    test "list_transporter_vehicle/0 returns all transporter_vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert Transporter_vehicles.list_transporter_vehicle() == [transporter__vehicle]
    end

    test "get_transporter__vehicle!/1 returns the transporter__vehicle with given id" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert Transporter_vehicles.get_transporter__vehicle!(transporter__vehicle.id) == transporter__vehicle
    end

    test "create_transporter__vehicle/1 with valid data creates a transporter__vehicle" do
      valid_attrs = %{}

      assert {:ok, %Transporter_Vehicle{} = transporter__vehicle} = Transporter_vehicles.create_transporter__vehicle(valid_attrs)
    end

    test "create_transporter__vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transporter_vehicles.create_transporter__vehicle(@invalid_attrs)
    end

    test "update_transporter__vehicle/2 with valid data updates the transporter__vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      update_attrs = %{}

      assert {:ok, %Transporter_Vehicle{} = transporter__vehicle} = Transporter_vehicles.update_transporter__vehicle(transporter__vehicle, update_attrs)
    end

    test "update_transporter__vehicle/2 with invalid data returns error changeset" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Transporter_vehicles.update_transporter__vehicle(transporter__vehicle, @invalid_attrs)
      assert transporter__vehicle == Transporter_vehicles.get_transporter__vehicle!(transporter__vehicle.id)
    end

    test "delete_transporter__vehicle/1 deletes the transporter__vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert {:ok, %Transporter_Vehicle{}} = Transporter_vehicles.delete_transporter__vehicle(transporter__vehicle)
      assert_raise Ecto.NoResultsError, fn -> Transporter_vehicles.get_transporter__vehicle!(transporter__vehicle.id) end
    end

    test "change_transporter__vehicle/1 returns a transporter__vehicle changeset" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert %Ecto.Changeset{} = Transporter_vehicles.change_transporter__vehicle(transporter__vehicle)
    end
  end
end
