defmodule Exproject.TransportersTest do
  use Exproject.DataCase

  alias Exproject.Transporters

  describe "transporter" do
    alias Exproject.Transporters.Transporter

    import Exproject.TransportersFixtures

    @invalid_attrs %{status: nil, vehicle_plate: nil}

    test "list_transporter/0 returns all transporter" do
      transporter = transporter_fixture()
      assert Transporters.list_transporter() == [transporter]
    end

    test "get_transporter!/1 returns the transporter with given id" do
      transporter = transporter_fixture()
      assert Transporters.get_transporter!(transporter.id) == transporter
    end

    test "create_transporter/1 with valid data creates a transporter" do
      valid_attrs = %{status: true, vehicle_plate: "some vehicle_plate"}

      assert {:ok, %Transporter{} = transporter} = Transporters.create_transporter(valid_attrs)
      assert transporter.status == true
      assert transporter.vehicle_plate == "some vehicle_plate"
    end

    test "create_transporter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transporters.create_transporter(@invalid_attrs)
    end

    test "update_transporter/2 with valid data updates the transporter" do
      transporter = transporter_fixture()
      update_attrs = %{status: false, vehicle_plate: "some updated vehicle_plate"}

      assert {:ok, %Transporter{} = transporter} = Transporters.update_transporter(transporter, update_attrs)
      assert transporter.status == false
      assert transporter.vehicle_plate == "some updated vehicle_plate"
    end

    test "update_transporter/2 with invalid data returns error changeset" do
      transporter = transporter_fixture()
      assert {:error, %Ecto.Changeset{}} = Transporters.update_transporter(transporter, @invalid_attrs)
      assert transporter == Transporters.get_transporter!(transporter.id)
    end

    test "delete_transporter/1 deletes the transporter" do
      transporter = transporter_fixture()
      assert {:ok, %Transporter{}} = Transporters.delete_transporter(transporter)
      assert_raise Ecto.NoResultsError, fn -> Transporters.get_transporter!(transporter.id) end
    end

    test "change_transporter/1 returns a transporter changeset" do
      transporter = transporter_fixture()
      assert %Ecto.Changeset{} = Transporters.change_transporter(transporter)
    end
  end
end
