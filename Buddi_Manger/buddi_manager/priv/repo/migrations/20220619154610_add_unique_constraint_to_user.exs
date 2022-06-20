defmodule BuddiManager.Repo.Migrations.AddUniqueConstraintToUser do
  use Ecto.Migration

  def change do
    create(index("users", [:email], unique: true))
    create(index("users", [:user_name], unique: true))
  end
end
