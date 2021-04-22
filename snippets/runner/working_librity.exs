# Working librity

{:ok, path} = CloneAndTest.Cloner.call("librity", "nlw4_elixir")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_queue")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_jwt_ttl")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_repo_tests")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_nutri_entities")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_flightex_tests")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_concurrent_report")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "nlw5_elixir")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "todo_in_action")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)
