defmodule PipaBank.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :number, :integer
      add :name, :string
      add :age, :integer
      add :email, :string
      add :balance, :integer

      timestamps()
    end
  end
end
