defmodule AddUsersToRepo do
  alias BuddiManager.Repo
  alias BuddiManager.Accounts.User
  def run_add_users() do
    %User{
      name: "Masud Rana",
      email: "masud@buddi.com",
      password: "abcds",
      user_name: "masuder"
    }
    |> Repo.insert!()

    %User{
      name: "Abrar Fahad",
      email: "masud1@buddi.com",
      password: "abcds",
      user_name: "masuder1"
    }
    |> Repo.insert!()

    %User{
      name: "Imran Talikdar",
      email: "masud2@buddi.com",
      password: "abcds",
      user_name: "masuder2"
    }
    |> Repo.insert!()
  end
end

AddUsersToRepo.run_add_users()
