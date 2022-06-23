defmodule BuddiManagerWeb.PageView do
  use BuddiManagerWeb, :view

  @doc """
  This method will truncate the note to make it usable for dashboard card view
  """
  def truncate_note(note) do
    note.content
    |> String.slice(0..100)
    |> Kernel.<>("...")
  end

  def first_notes_row(notes, per_row) do
    Enum.take(notes, per_row)
  end

  def second_notes_row(notes, per_row) do
    remained = Enum.count(notes) - Enum.count(first_notes_row(notes, per_row))

    cond do
      remained > 0 -> Enum.take(notes, -remained)
      true -> []
    end
  end
end
