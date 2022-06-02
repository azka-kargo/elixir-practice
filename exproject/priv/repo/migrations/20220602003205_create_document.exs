defmodule Exproject.Repo.Migrations.CreateDocument do
  use Ecto.Migration

  def change do
    create table(:document) do
      add :type, :string
      add :document_url, :string
      add :reference_id, :string
      add :reference_table, :string
      add :id, :string

      timestamps()
    end
  end
end
