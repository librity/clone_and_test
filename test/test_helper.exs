ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(CloneAndTest.Repo, :manual)

Mox.defmock(GithubMock, for: Github.Behaviour)
