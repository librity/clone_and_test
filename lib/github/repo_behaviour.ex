defmodule Github.Behaviour do
  alias Repo.Error

  @typep get_user_repos_return :: {:ok, list()} | {:error, Error.t()}
  @callback get_user_repos(String.t()) :: get_user_repos_return

  @typep get_repo_return :: {:ok, list()} | {:error, Error.t()}
  @callback get_repo(String.t(), String.t()) :: get_repo_return
end
