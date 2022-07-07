defmodule BuddiManager.Repo.Migrations.AddUserContraintToNoteUp do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :user_id, references(:users)
    end
  end
end
