defmodule BuddiManagerWeb.NoteWebLive do
  use BuddiManagerWeb, :live_view
  # import BuddiManagerWeb.LiveHelpers
  # alias BuddiManager.Notes
  alias BuddiManager.Notes.Note

  def render(assigns) do
    # IO.inspect(assigns)
    Phoenix.View.render(BuddiManagerWeb.NoteWebLiveView, "index.html", assigns)
  end

  def mount(_params, %{"current_user" => user, "config" => pow_config} = _session, socket) do
    fake_conn =
      %Plug.Conn{}
      |> Pow.Plug.put_config(pow_config)
      |> Pow.Plug.assign_current_user(user, pow_config)

    changeset =
      %Note{
        created_by: user.name,
        user: user,
        content: ""
      }
      |> Note.changeset(%{})

    socket =
      socket
      |> assign(conn: fake_conn)
      |> assign(changeset: changeset)
      |> assign(preview_content: "")

    {:ok, socket}
  end

  def handle_event("form.create_note.change", params, socket) do
    %{
      "note" => %{"content" => content}
    } = params

    content =
      content
      |> Earmark.as_html!()
      |> Phoenix.HTML.raw()

    {:noreply, socket |> assign(preview_content: content)}
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
