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

# Modules

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_list_filter")
{:ok, result} = CloneAndTest.Runner.call(path, false)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_nutri_entities")
{:ok, result} = CloneAndTest.Runner.call(path, true)

{:ok, path} = CloneAndTest.Cloner.call("librity", "ignite_rockelivery")
{:ok, result} = CloneAndTest.Runner.call(path, true)

{:ok, path} = CloneAndTest.Cloner.call("raulpe7eira", "rp7pay")
{:ok, result} = CloneAndTest.Runner.call(path, true)
