defmodule ExprojectWeb.Schema.Vehicle do
  # required to make a module graphQL Schema
  use Absinthe.Schema
  # this is the resolver that will be used
  alias ExprojectWeb.VehicleResolver
  query do
  # this is the query entry point to our app
    field :all_vehicle, non_null(list_of(non_null(:id))) do
      arg(:id, :string)
      arg(:licensePlate, :string)
      arg(:status, :string)


      middleware(Middleware.Authorize, Role.all())
      resolve(&TransporterResolver.all_vehicle/3)

    end
  end
  mutation do
  # this is the mutation entry point to our app
  end
end
