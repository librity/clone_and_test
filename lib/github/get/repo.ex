defmodule Github.Get.Repo do
  use Github.Get

  def call(url, owner, repo_name) do
    "#{url}/repos/#{owner}/#{repo_name}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_get({:ok, %Response{status: 404, body: _body}}),
    do: {:error, Error.build(:not_found, "Github user not found")}

  defp handle_get({:ok, %Response{status: 200, body: raw_repo}}),
    do: {:ok, RepoInfo.build(raw_repo)}
end
