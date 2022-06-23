defmodule BuddiManager.Helpers do
  @doc """
  Use it when you need filename from file path where filename is also differ from original one by addition of a unique id
  unique id is joined with a specific joiner
  function overload will be made that can accept the index place from the right from where original name should be extracted
  """
  def get_filename_from_path(path, joiner) do
    extension = Path.extname(path)

    result =
      path
      |> Path.basename()
      |> String.split(joiner)

    joiner = if Enum.count(result) > 2, do: joiner, else: ""

    cond do
      Enum.count(result) > 1 ->
        result
        |> Enum.drop(-1)
        |> Enum.join(joiner)
        |> Kernel.<>(extension)

      true ->
        result |> Enum.at(0)
    end
  end
end
