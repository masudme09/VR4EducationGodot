defmodule BuddiManager.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :created_by, :string
      add :created, :utc_datetime
      add :updated, :utc_datetime
      add :label, :text
      add :content, :text

      timestamps()
    end
  end
end
