defmodule CloneAndTest.Runner do
  alias CloneAndTest.Error
  alias CloneAndTest.Runner.Success

  def call(path, is_phoenix?) do
    {:ok, app_root} = current_dir()

    with true <- repo_exists?(path),
         :ok <- go_to(path),
         {repo_files, 0} <- get_files(),

         # Tests
         :ok <- set_env(),
         {deps_result, 0} <- install_deps(),
         {db_setup_result, 0} <- drop_db(is_phoenix?),
         {test_results, 0} <- run_tests(),
         {db_drop_result, 0} <- drop_db(is_phoenix?),

         # Cleanup
         :ok <- reset_env(),
         :ok <- go_to(app_root),
         {:ok, ^app_root} <- current_dir(),
         {:ok, deleted_files} <- delete_repo(path) do
      {:ok,
       Success.build({
         path,
         is_phoenix?,
         app_root,
         repo_files,
         deps_result,
         db_setup_result,
         test_results,
         db_drop_result,
         deleted_files
       })}
    else
      error -> handle_error(error, {app_root, path})
    end
  end

  defp handle_error(error, {app_root, path}) do
    with :ok <- reset_env(),
         :ok <- go_to(app_root),
         {:ok, _deleted_files} <- delete_repo(path) do
      {:error, Error.build(:bad_request, error)}
    end
  end

  defp repo_exists?(path) do
    IO.puts("Check repo #{path}")

    File.exists?(path)
  end

  defp current_dir do
    IO.puts("Check current directory")

    File.cwd()
  end

  defp go_to(path) do
    IO.puts("Change directory #{path}")

    File.cd(path)
  end

  defp get_files do
    IO.puts("List files")

    System.cmd("ls", [])
  end

  defp install_deps do
    IO.puts("Install dependencies")

    System.cmd("mix", ["deps.get"])
  end

  defp run_tests do
    IO.puts("Run tests")

    System.cmd("mix", ["test", "--trace"])
  end

  defp delete_repo(path) do
    IO.puts("Delete #{path}")

    File.rm_rf(path)
  end

  defp set_env do
    IO.puts("Set MIX_ENV to test")

    System.put_env("MIX_ENV", "test")
  end

  defp reset_env do
    IO.puts("Reset MIX_ENV")

    System.delete_env("MIX_ENV")
  end

  defp setup_db(is_phoenix?) do
    case is_phoenix? do
      false ->
        {"NOT PHOENIX", 0}

      true ->
        IO.puts("Setup database")
        System.cmd("mix", ["ecto.reset"])
    end
  end

  defp drop_db(is_phoenix?) do
    case is_phoenix? do
      false ->
        {"NOT PHOENIX", 0}

      true ->
        IO.puts("Drop database")
        System.cmd("mix", ["ecto.drop"])
    end
  end
end
