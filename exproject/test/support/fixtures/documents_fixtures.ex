defmodule Exproject.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exproject.Documents` context.
  """

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        document_url: "some document_url",
        reference_id: "some reference_id",
        reference_table: "some reference_table",
        type: "some type"
      })
      |> Exproject.Documents.create_document()

    document
  end
end
