defmodule CloneAndTest.Repo do
  use Ecto.Repo,
    otp_app: :clone_and_test,
    adapter: Ecto.Adapters.Postgres
end
