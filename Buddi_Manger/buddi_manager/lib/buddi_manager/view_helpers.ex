defmodule BuddiManager.ViewHelpers do
  use Phoenix.HTML

  def i(str) do
    content_tag(:pre, inspect(str, pretty: true))
  end
end
