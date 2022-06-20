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
end
