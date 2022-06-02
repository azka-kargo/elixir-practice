defmodule ExprojectWeb.Schema.VehicleResolver do
  # required to make a module graphQL Schema
  use Absinthe.Schema
  # this is the resolver that will be used
  alias ExprojectWeb.VehicleResolver
  query do
  # this is the query entry point to our app
    @desc: "Get all transporter"
    field :all_transporter, non_null(list_of(non_null(:id))) do
      arg(:id, :string)
      arg(:user_id, non_null(:string))

      middleware(Middleware.Authorize, Role.all())
      resolve(&VehicleResolver.all_vehicle/3)

    end

  end
  mutation do
  # this is the mutation entry point to our app
  end
end
