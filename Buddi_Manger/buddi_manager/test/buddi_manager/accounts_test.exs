defmodule BuddiManager.AccountsTest do
  use BuddiManager.DataCase

  alias BuddiManager.Accounts

  describe "users" do
    alias BuddiManager.Accounts.User

    import BuddiManager.AccountsFixtures

    @invalid_attrs %{
      email: nil,
      institution: nil,
      name: nil,
      "no-context": nil,
      "no-schema": nil,
      password: nil,
      user_name: nil,
      "—": nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        email: "bla@email.com",
        institution: "some institution",
        name: "some name",
        "no-context": "some no-context",
        "no-schema": "some no-schema",
        password: "some password",
        user_name: "some user_name",
        "—": "some —"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "bla@email.com"
      assert user.institution == "some institution"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.user_name == "some user_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        email: "bla@email.com",
        institution: "some updated institution",
        name: "some updated name",
        "no-context": "some updated no-context",
        "no-schema": "some updated no-schema",
        password: "some updated password",
        user_name: "some updated user_name",
        "—": "some updated —"
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "bla@email.com"
      assert user.institution == "some updated institution"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.user_name == "some updated user_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
