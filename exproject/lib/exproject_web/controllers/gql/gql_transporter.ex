defmodule ExprojectWeb.Schema.Transporter do
  # required to make a module graphQL Schema
  use Absinthe.Schema
  # this is the resolver that will be used
  alias ExprojectWeb.TransporterResolver
  query do
  # this is the query entry point to our app
    field :all_transporter, non_null(list_of(non_null(:id))) do
      arg(:id, :string)
      arg(:name, non_null(:string))
      arg(:npwp, :string)
      arg(:phoneNumber, :integer)

      arg(:status, :string)

      # arg(:vehicle, :vehicle)

      middleware(Middleware.Authorize, Role.all())
      resolve(&TransporterResolver.all_transporter/3)

    end

  end
  mutation do
  # this is the mutation entry point to our app
  end
end
