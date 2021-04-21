defmodule Github do
  alias Github.Behaviour

  alias Github.Get.Repo, as: GetRepo
  alias Github.Get.UserRepos, as: GetUserRepos

  @behaviour Behaviour
  @base_url "https://api.github.com"

  defdelegate get_user_repos(url \\ @base_url, owner), to: GetUserRepos, as: :call
  defdelegate get_repo(url \\ @base_url, owner, repo_name), to: GetRepo, as: :call
end
