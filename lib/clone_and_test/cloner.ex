defmodule CloneAndTest.Cloner do
  @sandbox_dir "sandbox"

  def call(owner, repo_name) do
    params = [_url, repo_path] = gen_url_and_path(owner, repo_name)

    case Git.clone(params) do
      {:ok, _repo} -> {:ok, repo_path}
      {:error, _reason} = error -> error
    end
  end

  def gen_url_and_path(owner, repo_name) do
    [
      "https://github.com/#{owner}/#{repo_name}",
      Path.join([".", @sandbox_dir, owner, repo_name])
    ]
  end
end
