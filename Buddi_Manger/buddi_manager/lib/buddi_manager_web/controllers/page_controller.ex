defmodule BuddiManagerWeb.PageController do
  # import Plug.Conn
  use BuddiManagerWeb, :controller
  alias BuddiManager.Notes
  alias BuddiManager.Repo

  def index(conn, _params) do
    notes = Notes.Note |> Repo.all()

    IO.inspect(notes: notes)

    conn =
      conn
      |> assign(:notes, notes)

    render(conn, "index.html")
  end
end
