defmodule BuddiManager.Repo.Migrations.AddUserContraintToNote do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :user_id, references(:users)
    end
  end
end
