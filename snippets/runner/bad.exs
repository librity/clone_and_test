# Bad

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "exmeal")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)
