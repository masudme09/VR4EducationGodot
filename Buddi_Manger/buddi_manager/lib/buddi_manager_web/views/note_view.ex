defmodule BuddiManagerWeb.NoteView do
  use BuddiManagerWeb, :view
  alias BuddiManagerWeb.NoteView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{
      id: note.id,
      created_by: note.created_by,
      created: note.created,
      updated: note.updated,
      content: note.content,
      label: note.label
    }
  end
end
