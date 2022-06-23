defmodule BuddiManagerWeb.UserView do
  use BuddiManagerWeb, :view
  alias BuddiManagerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      institution: user.institution,
      name: user.name,
      password: user.password,
      user_name: user.user_name
    }
  end

  def list_users(count) do
    BuddiManager.Accounts.list_users(count)
  end
end
