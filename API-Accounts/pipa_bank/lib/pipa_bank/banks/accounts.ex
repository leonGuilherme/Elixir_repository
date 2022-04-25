defmodule PipaBank.Banks.Accounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :age, :integer
    field :balance, :integer
    field :email, :string
    field :name, :string
    field :number, :integer

    timestamps()
  end

  @doc false
  def changeset(accounts, attrs) do
    accounts
    |> cast(attrs, [:number, :name, :age, :email, :balance])
    |> validate_required([:number, :name, :age, :email, :balance])
    |> validate_inclusion(:age, 18..100)
    |> validate_format(:email, ~r/@/)

  end
end
