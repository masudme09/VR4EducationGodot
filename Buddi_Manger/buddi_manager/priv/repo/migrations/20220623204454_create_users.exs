defmodule BuddiManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string
      add :institution, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
