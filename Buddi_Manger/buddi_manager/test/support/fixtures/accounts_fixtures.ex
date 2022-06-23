defmodule BuddiManager.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BuddiManager.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "bla@email.com",
        institution: "some institution",
        name: "some name",
        password: "some password",
        user_name: "some user_name"
      })
      |> BuddiManager.Accounts.create_user()

    user
  end
end
