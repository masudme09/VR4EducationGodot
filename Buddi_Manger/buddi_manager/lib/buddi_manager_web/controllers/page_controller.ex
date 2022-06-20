defmodule BuddiManagerWeb.PageController do
  # import Plug.Conn
  use BuddiManagerWeb, :controller
  alias BuddiManager.Notes

  def index(conn, _params) do
    notes = Notes.list_notes()

    conn =
      conn
      |> assign(:notes, notes)

    render(conn, "index.html")
  end
end
