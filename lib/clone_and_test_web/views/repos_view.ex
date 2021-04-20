defmodule CloneAndTestWeb.ReposView do
  use CloneAndTestWeb, :view

  alias Github.RepoInfo

  def render("repos.json", %{repos: [%RepoInfo{} | _tails] = repos}), do: %{repos: repos}
end
