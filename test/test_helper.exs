ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(CloneAndTest.Repo, :manual)

Mox.defmock(Github.ClientMock, for: Github.Behaviour)
