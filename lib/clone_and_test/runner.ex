defmodule CloneAndTest.Runner do
  alias CloneAndTest.Error
  alias CloneAndTest.Runner.Result

  def call(path, is_phoenix?) do
    with true <- repo_exists?(path),
         {:ok, app_root} <- current_dir(),
         :ok <- go_to(path),
         {repo_files, 0} <- get_files(),
         {deps_result, 0} <- install_deps(),
         {db_setup_result, 0} <- setup_db(is_phoenix?),
         {test_results, 0} <- run_tests(),
         {db_drop_result, 0} <- drop_db(is_phoenix?),
         :ok <- go_to(app_root),
         {:ok, ^app_root} <- current_dir(),
         {:ok, deleted_files} <- delete_repo(path) do
      {:ok,
       Result.build(
         {path, is_phoenix?, app_root, repo_files, deps_result, db_setup_result, test_results,
          db_drop_result, deleted_files}
       )}
    else
      error -> {:error, Error.build(:bad_request, error)}
    end
  end

  defp repo_exists?(path), do: File.exists?(path)
  defp current_dir, do: File.cwd()
  defp go_to(path), do: File.cd(path)
  defp get_files, do: System.cmd("ls", [])
  defp install_deps, do: System.cmd("mix", ["deps.get"])
  defp run_tests, do: System.cmd("mix", ["test"])
  defp delete_repo(path), do: File.rm_rf(path)

  defp setup_db(is_phoenix?) do
    case is_phoenix? do
      false -> {"NOT PHOENIX", 0}
      true -> System.cmd("mix", ["ecto.reset"])
    end
  end

  defp drop_db(is_phoenix?) do
    case is_phoenix? do
      false -> {"NOT PHOENIX", 0}
      true -> System.cmd("mix", ["ecto.drop"])
    end
  end
end
