defmodule BuddiManager.Users.User do
  import Ecto.Changeset
  use Ecto.Schema
  use Pow.Ecto.Schema
  @required [:email, :password_hash, :name]
  @optional [
    :institution
  ]

  schema "users" do
    pow_user_fields()
    field :institution, :string
    field :name, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> cast(attrs, @required ++ @optional)
    |> IO.inspect
    |> validate_required(@required)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> IO.inspect(label: :final)
  end
end
