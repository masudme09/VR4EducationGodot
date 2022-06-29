defmodule BuddiManagerWeb.DashboardController do
  use BuddiManagerWeb, :controller
  alias BuddiManager.Notes

  def index(conn, params) do
    # per page should be even number
    per_page = 10
    page = params["page"] || 1

    per_row = div(per_page, 2)
    notes = Notes.list_notes(:paged, page, per_page)

    conn
    |> assign(:notes, notes)
    |> assign(:per_page, per_page)
    |> assign(:per_row, per_row)
    |> put_layout("dashboard.html")
    |> render("index.html")
  end

end
