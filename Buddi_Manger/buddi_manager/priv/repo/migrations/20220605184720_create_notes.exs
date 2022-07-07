defmodule BuddiManager.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :created_by, :string
      add :created, :utc_datetime
      add :updated, :utc_datetime
      add :label, :string
      add :content, :string

      timestamps()
    end
  end
end
