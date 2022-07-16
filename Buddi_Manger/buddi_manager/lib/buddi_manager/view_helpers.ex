defmodule BuddiManager.ViewHelpers do
  use Phoenix.HTML

  def i(str) do
    content_tag(:pre, inspect(str, pretty: true))
  end

  def note_visualize(note) do
    if note && note.content do
      note.content
      |> Earmark.as_html!()
      |> Phoenix.HTML.raw()
    else
      ""
    end
  end

  def changeset_errors(changeset, opts \\ []) do
    if changeset && changeset.action && !changeset.valid? do
      errors = full_messages(changeset, opts)
      if errors, do: content_tag(:div, errors, class: "alert alert-danger")
    end
  end

  def full_messages(%Ecto.Changeset{} = changeset, _opts \\ []) do
    if changeset.valid? do
      nil
    else
      Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
          opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
        end)
      end)
    end
  end
end
