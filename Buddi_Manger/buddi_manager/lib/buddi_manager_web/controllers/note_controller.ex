defmodule BuddiManagerWeb.NoteController do
  use BuddiManagerWeb, :controller

  alias BuddiManager.Notes
  alias BuddiManager.Notes.Note

  action_fallback BuddiManagerWeb.FallbackController

  def index(conn, _params) do
    notes = Notes.list_notes()
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{"note" => note_params}) do
    with {:ok, %Note{} = note} <- Notes.create_note(note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_path(conn, :show, note))
      |> render("show.json", note: note)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Notes.get_note!(id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Notes.get_note!(id)

    with {:ok, %Note{} = note} <- Notes.update_note(note, note_params) do
      render(conn, "show.json", note: note)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Notes.get_note!(id)

    with {:ok, %Note{}} <- Notes.delete_note(note) do
      send_resp(conn, :no_content, "")
    end
  end

  def show_web(conn, %{"id" => id}) do
    note = Notes.get_note!(id)

    conn
    |> put_layout("general.html")
    |> render("show.html", note: note)
  end

  def delete_web(conn, %{"id" => id}) do
    note = Notes.get_note!(id)

    with {:ok, %Note{}} <- Notes.delete_note(note) do
      conn
      |> put_flash(:deleted, note.label)
      |> redirect(to: Routes.dashboard_path(conn, :index))
    end
  end
end
