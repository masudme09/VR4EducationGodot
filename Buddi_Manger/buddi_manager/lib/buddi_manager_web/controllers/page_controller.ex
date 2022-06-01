defmodule BuddiManagerWeb.PageController do
  use BuddiManagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
