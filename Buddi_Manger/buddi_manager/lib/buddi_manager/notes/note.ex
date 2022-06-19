defmodule BuddiManager.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:created_by, :content]

  @optional [
    :label,
    :created,
    :updated
  ]

  schema "notes" do
    field :created_by, :string
    field :created, :utc_datetime
    field :updated, :utc_datetime
    field :label, :string
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
