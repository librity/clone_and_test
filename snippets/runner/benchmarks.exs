:timer.tc(fn ->
  {:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_rockelivery")
  {:ok, result} = CloneAndTest.Runner.call(path, true)
  IO.puts(result.test_results)
end)

# Without copying precompiled deps: 109075895 ms = 1.81793158 minutes
# Copying precompiled deps: 63170268 ms = 1.0528378 minutes
