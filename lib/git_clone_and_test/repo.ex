defmodule GitCloneAndTest.Repo do
  use Ecto.Repo,
    otp_app: :git_clone_and_test,
    adapter: Ecto.Adapters.Postgres
end
