defmodule BuddiManager.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:email, :password, :user_name]

  @optional [
    :institution
  ]

  schema "users" do
    field :email, :string
    field :institution, :string
    field :name, :string
    field :password, :string
    field :user_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional)
    |> validate_required([@required])
  end
end
