defmodule CloneAndTest.Runner.Success do
  @keys [
    :path,
    :is_phoenix?,
    :app_root,
    :repo_files,
    :deps_result,
    :db_setup_result,
    :test_results,
    :db_drop_result,
    :deleted_files
  ]

  @enforce_keys @keys

  defstruct @keys

  def build(
        {path, is_phoenix?, app_root, repo_files, deps_result, db_setup_result, test_results,
         db_drop_result, deleted_files}
      ) do
    %__MODULE__{
      path: path,
      is_phoenix?: is_phoenix?,
      app_root: app_root,
      repo_files: repo_files,
      deps_result: deps_result,
      db_setup_result: db_setup_result,
      test_results: test_results,
      db_drop_result: db_drop_result,
      deleted_files: deleted_files
    }
  end
end
