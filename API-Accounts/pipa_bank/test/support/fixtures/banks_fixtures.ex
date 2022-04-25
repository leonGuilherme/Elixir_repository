defmodule PipaBank.BanksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PipaBank.Banks` context.
  """

  @doc """
  Generate a accounts.
  """
  def accounts_fixture(attrs \\ %{}) do
    {:ok, accounts} =
      attrs
      |> Enum.into(%{
        age: 42,
        balance: 42,
        email: "some email",
        name: "some name",
        number: 42
      })
      |> PipaBank.Banks.create_accounts()

    accounts
  end
end
