defmodule BuddiManagerWeb.PageController do
  # import Plug.Conn
  use BuddiManagerWeb, :controller
  alias BuddiManager.Notes

  def index(conn, params) do
    # per page should be even number
    per_page = 12
    page = params["page"] || 1

    per_row = div(per_page, 2)
    notes = Notes.list_notes(:paged, page, per_page)

    conn =
      conn
      |> assign(:notes, notes)
      |> assign(:per_page, per_page)
      |> assign(:per_row, per_row)

    render(conn, "index.html")
  end
end
