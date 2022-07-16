defmodule BuddiManager.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset
  alias BuddiManager.Accounts.User

  @required [:created_by, :user_id]

  @optional [
    :label,
    :created,
    :updated,
    :content
  ]

  schema "notes" do
    field :created_by, :string
    field :created, :utc_datetime
    field :updated, :utc_datetime
    field :label, :string
    field :content, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(note, attrs \\ %{}) do
    note
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> cast_assoc(:user)
  end
end
