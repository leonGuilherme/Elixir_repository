defmodule PipaBank.Repo do
  use Ecto.Repo,
    otp_app: :pipa_bank,
    adapter: Ecto.Adapters.Postgres
end
