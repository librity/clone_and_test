# Working external

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "flightex")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("edupiorini", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("svgreve", "list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("HVDgeek", "list_filter_elixir")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("WilsonNet", "ignite-elixir-desafio-01")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("brunolipe-a", "elixir_list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("brunolipe-a", "elixir_list_length")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("alemaocastro1986", "ignite-challenge-two")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("cassiofariasmachado", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("Matheus-Campos", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("edupiorini", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)
