defmodule Exproject.Documents.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "document" do
    field :document_url, :string
    field :reference_id, :string
    field :reference_table, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:type, :document_url, :reference_id, :reference_table])
    |> validate_required([:type, :document_url, :reference_id, :reference_table])
  end
end
