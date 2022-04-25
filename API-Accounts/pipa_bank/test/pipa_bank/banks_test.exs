defmodule PipaBank.BanksTest do
  use PipaBank.DataCase

  alias PipaBank.Banks

  describe "accounts" do
    alias PipaBank.Banks.Accounts

    import PipaBank.BanksFixtures

    @invalid_attrs %{age: nil, balance: nil, email: nil, name: nil, number: nil}

    test "list_accounts/0 returns all accounts" do
      accounts = accounts_fixture()
      assert Banks.list_accounts() == [accounts]
    end

    test "get_accounts!/1 returns the accounts with given id" do
      accounts = accounts_fixture()
      assert Banks.get_accounts!(accounts.id) == accounts
    end

    test "create_accounts/1 with valid data creates a accounts" do
      valid_attrs = %{age: 42, balance: 42, email: "some email", name: "some name", number: 42}

      assert {:ok, %Accounts{} = accounts} = Banks.create_accounts(valid_attrs)
      assert accounts.age == 42
      assert accounts.balance == 42
      assert accounts.email == "some email"
      assert accounts.name == "some name"
      assert accounts.number == 42
    end

    test "create_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_accounts(@invalid_attrs)
    end

    test "update_accounts/2 with valid data updates the accounts" do
      accounts = accounts_fixture()
      update_attrs = %{age: 43, balance: 43, email: "some updated email", name: "some updated name", number: 43}

      assert {:ok, %Accounts{} = accounts} = Banks.update_accounts(accounts, update_attrs)
      assert accounts.age == 43
      assert accounts.balance == 43
      assert accounts.email == "some updated email"
      assert accounts.name == "some updated name"
      assert accounts.number == 43
    end

    test "update_accounts/2 with invalid data returns error changeset" do
      accounts = accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_accounts(accounts, @invalid_attrs)
      assert accounts == Banks.get_accounts!(accounts.id)
    end

    test "delete_accounts/1 deletes the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{}} = Banks.delete_accounts(accounts)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_accounts!(accounts.id) end
    end

    test "change_accounts/1 returns a accounts changeset" do
      accounts = accounts_fixture()
      assert %Ecto.Changeset{} = Banks.change_accounts(accounts)
    end
  end
end
