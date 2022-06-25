defmodule BuddiManagerWeb.NoteWebLive do
  use BuddiManagerWeb, :live_view
  # import BuddiManagerWeb.LiveHelpers
  # import Pow.Plug
  # alias BuddiManager.Notes
  # alias BuddiManager.Notes.Note

  def render(assigns) do
    # IO.inspect(assigns)
    Phoenix.View.render(BuddiManagerWeb.NoteWebView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    IO.inspect(session)

    {:ok, socket}
  end

  # def index(conn, _params) do
  #   current_user = current_user(conn)

  #   changeset =
  #     %Note{
  #       created_by: current_user.name,
  #       user: current_user,
  #       content: ""
  #     }
  #     |> Note.changeset(%{})

  #   conn
  #   |> assign(:changeset, changeset)
  #   |> put_layout("general.html")
  #   |> render("index.html")
  # end

  # def create(conn, note_params) do
  #   with {:ok, %Note{} = note} <- Notes.create_note(note_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.note_web_path(conn, :show, note))
  #     |> render("show.html", note: note)
  #   end
  # end
end
