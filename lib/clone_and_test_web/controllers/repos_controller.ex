defmodule CloneAndTestWeb.ReposController do
  use CloneAndTestWeb, :controller

  alias CloneAndTestWeb.FallbackController
  alias Github.RepoInfo

  action_fallback FallbackController

  def show(conn, %{"username" => username}) do
    with {:ok, [%RepoInfo{} | _tails] = repos} <- get_github_client().get_user_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end

  defp get_github_client do
    :clone_and_test
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:github_adapter)
  end
end
