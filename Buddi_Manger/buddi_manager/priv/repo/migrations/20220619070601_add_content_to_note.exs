defmodule BuddiManager.Repo.Migrations.AddContentToNote do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :content, :string
    end
  end
end
