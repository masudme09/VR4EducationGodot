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
      |> valid_user_attributes()
      |> BuddiManager.Accounts.register_user()

    user
  end

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password()
    })
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
