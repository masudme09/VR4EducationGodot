defmodule BuddiManager.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BuddiManager.Notes` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        created_by: "some created_by",
        created: ~U[2022-06-04 19:21:00Z],
        content: "some text bla bla",
        label: "some label",
        updated: ~U[2022-06-04 19:21:00Z]
      })
      |> BuddiManager.Notes.create_note()

    note
  end
end
