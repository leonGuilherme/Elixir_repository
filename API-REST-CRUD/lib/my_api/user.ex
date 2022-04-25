defmodule MyApi.User do
  use Ecto.Schema
  alias MyApi.Repo

  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :age, :email, :password])
    |> validate_required([:name, :age, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..100)
  end

  def get_all(), do: Repo.all(MyApi.User)

  def find_by_id(id), do: Repo.get(MyApi.User, id)

  def insert(user) do
    %MyApi.User{}
    |> changeset(user)
    |> Repo.insert()
  end

  def update(id, data) do
    case find_by_id(id) do
      nil ->
        {:error, :not_found}

      user ->
        user
        |> changeset(data)
        |> Repo.update()
    end
  end

  def delete(id) do
    case find_by_id(id) do
      nil ->
        {:error, :not_found}

      user ->
        Repo.delete(user)
    end
  end
end
