defmodule Github.Get.UserRepos do
  use Github.Get

  def call(url, owner) do
    "#{url}/users/#{owner}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_get({:ok, %Response{status: 404, body: _body}}),
    do: {:error, Error.build(:not_found, "Github user not found")}

  defp handle_get({:ok, %Response{status: 200, body: raw_repos}}),
    do: {:ok, RepoInfo.build_many(raw_repos)}
end
