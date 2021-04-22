# Failing

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "Report-gen")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "Rocketpay")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("raulpe7eira", "rp7pay")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("joaopealves", "ex_mon")
{:ok, result} = CloneAndTest.Runner.call(path, false)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("ngdevsousa", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("arthurgrigoletto", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)

{:ok, path} = CloneAndTest.Cloner.call("mattheusmarzola", "rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)
IO.puts(result.test_results)
