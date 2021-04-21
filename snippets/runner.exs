System.get_env("MIX_ENV")
System.put_env("MIX_ENV", "test")
System.get_env("MIX_ENV")
System.cmd("mix", ["ecto.drop"])
System.delete_env("MIX_ENV")
System.get_env("MIX_ENV")

# Basic script

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_nutri_entities")

is_phoenix? = true
{:ok, app_root} = File.cwd()

true = File.exists?(path)
:ok = File.cd(path)
{repo_files, 0} = System.cmd("ls", [])
{deps_result, 0} = System.cmd("mix", ["deps.get"])

if is_phoenix? do
  {ecto_result, 0} = System.cmd("mix", ["ecto.reset"])
end

{test_results, 0} = System.cmd("mix", ["test"])

if is_phoenix? do
  {ecto_result, 0} = System.cmd("mix", ["ecto.drop"])
end

:ok = File.cd(app_root)
{:ok, ^app_root} = File.cwd()
{:ok, deleted_files} = File.rm_rf(path)

# Working

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_nutri_entities")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("edupiorini", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

# Failing

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "Report-gen")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "ex_mon")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "flightex")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "exmeal")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "Rocketpay")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("raulpe7eira", "rp7pay")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("svgreve", "list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("HVDgeek", "list_filter_elixir")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("WilsonNet", "ignite-elixir-desafio-01")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("brunolipe", "a/elixir_list_length")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("brunolipe", "a/elixir_list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("alemaocastro1986", "ignite-challenge-two")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("ngdevsousa", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("cassiofariasmachado", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("arthurgrigoletto", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("Matheus", "Campos/rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("mattheusmarzola", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("edupiorini", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)
