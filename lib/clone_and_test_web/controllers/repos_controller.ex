defmodule CloneAndTestWeb.ReposController do
  use CloneAndTestWeb, :controller

  alias CloneAndTestWeb.FallbackController
  alias Github.RepoInfo

  action_fallback FallbackController

  def show(conn, %{"owner" => owner, "repo_name" => repo_name}) do
    with {:ok, %RepoInfo{} = repo} <- get_client().get_repo(owner, repo_name) do
      conn
      |> put_status(:ok)
      |> render("repo.json", repo: repo)
    end
  end

  def show(conn, %{"owner" => owner}) do
    with {:ok, [%RepoInfo{} | _tails] = repos} <- get_client().get_user_repos(owner) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end

  defp get_client do
    :clone_and_test
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:github_adapter)
  end
end
