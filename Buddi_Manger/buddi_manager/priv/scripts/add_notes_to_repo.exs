defmodule AddNotesToRepo do
  alias BuddiManager.Repo
  alias BuddiManager.Notes.Note
  def run_add_notes() do
    %Note{
      created_by: "Masud Rana",
      content: "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs."
    }
    |> Repo.insert!()

    %Note{
      created_by: "Masud Rana",
      content: "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs."
    }
    |> Repo.insert!()

    %Note{
      created_by: "Masud Rana",
      content: "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs."
    }
    |> Repo.insert!()

    %Note{
      created_by: "Masud Rana",
      content: "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs."
    }
    |> Repo.insert!()

    %Note{
      created_by: "Masud Rana",
      content: "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs."
    }
    |> Repo.insert!()
  end
end

AddNotesToRepo.run_add_notes()
