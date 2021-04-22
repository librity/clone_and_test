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
