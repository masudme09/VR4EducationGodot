BuddiManager.Repo.insert!(%BuddiManager.Notes.Note{
  content:
    "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs.",
  created_by: "Masud Rana",
  label: "test task 1"
})

BuddiManager.Repo.insert!(%BuddiManager.Notes.Note{
  content:
    "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs.",
  created_by: "Masud Rana",
  label: "test task 2"
})

BuddiManager.Repo.insert!(%BuddiManager.Notes.Note{
  content:
    "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs.",
  created_by: "Masud Rana",
  label: "test task 3"
})

BuddiManager.Repo.insert!(%BuddiManager.Notes.Note{
  content:
    "A quick brown fox jump over the lazy dogs. Again a quick brown fox jump over the lazy dogs.",
  created_by: "Masud Rana",
  label: "test task 4"
})

%BuddiManager.Accounts.User{
  name: "Masud Rana",
  email: "masud@buddi.com",
  password: "abcds",
  user_name: "masuder"
}
|> BuddiManager.Repo.insert!()

%BuddiManager.Accounts.User{
  name: "Abrar Fahad",
  email: "masud1@buddi.com",
  password: "abcds",
  user_name: "masuder1"
}
|> BuddiManager.Repo.insert!()

%BuddiManager.Accounts.User{
  name: "Imran Talikdar",
  email: "masud2@buddi.com",
  password: "abcds",
  user_name: "masuder2"
}
|> BuddiManager.Repo.insert!()
