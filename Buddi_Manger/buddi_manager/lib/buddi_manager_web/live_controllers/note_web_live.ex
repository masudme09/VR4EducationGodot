defmodule BuddiManagerWeb.NoteWebLive do
  use BuddiManagerWeb, :live_view
  # import BuddiManagerWeb.LiveHelpers
  # alias BuddiManager.Notes
  alias BuddiManager.Notes.Note
  alias BuddiManager.Repo

  def render(assigns, _params \\ %{}) do
    Phoenix.View.render(BuddiManagerWeb.NoteWebLiveView, "index.html", assigns)
  end

  def mount(params, %{"user_token" => user_token} = _session, socket) do
    user = BuddiManager.Accounts.get_user_by_session_token(user_token)

    note_id = params |> Map.get("id")
    changeset =
      if note_id do
        Repo.get!(Note, note_id)
        |> Note.changeset()
      else
        %Note{
          user: user,
          content: ""
        }
        |> Note.changeset(%{})
      end

    socket =
      socket
      |> assign(current_user: user)
      |> assign(changeset: changeset)
      |> assign(preview_content: "")
      |> assign(preview_label: "")

    {:ok, socket}
  end

  def handle_event("form.create_note.change", params, socket) do
    %{
      "note" => %{"content" => content, "label" => label} = note_params
    } = params

    # Update changeset
    changeset =
      socket.assigns.changeset.data
      |> Note.changeset(note_params)

    content =
      content
      |> Earmark.as_html!()
      |> Phoenix.HTML.raw()

    socket =
      socket
      |> assign(preview_content: content)
      |> assign(preview_label: label)
      |> assign(changeset: changeset)

    {:noreply, socket}
  end

  def handle_event(
        "form.create_note.submit",
        %{
          "note" => %{"content" => content, "label" => label} = note_params
        } = params,
        socket
      ) do
    result =
      socket.assigns.changeset.data
      |> Repo.preload([:user])
      |> Note.changeset(note_params)
      |> Repo.insert_or_update()

    case result do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Created or Updated")
         |> redirect(to: Routes.dashboard_path(BuddiManagerWeb.Endpoint, :index))}

      {:error, changeset} ->
        socket =
          socket
          |> put_flash(:info, "Something went wrong")
          |> assign(preview_content: content)
          |> assign(preview_label: label)
          |> assign(changeset: changeset)

        {:noreply, socket}
    end
  end
end
