defmodule BuddiManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_name, :string
      add :name, :string
      add :institution, :string
      add :password, :string
      add :email, :string

      timestamps()
    end
  end
end
