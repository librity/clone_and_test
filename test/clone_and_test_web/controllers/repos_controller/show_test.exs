defmodule CloneAndTestWeb.ReposController.CreateTest do
  use CloneAndTestWeb.ConnCase, async: true

  import Mox
  import CloneAndTest.Factory

  alias CloneAndTest.Error

  describe "create/2" do
    test "returns user's repos if user exists", %{conn: conn} do
      owner = "librity"

      expect(GithubMock, :get_user_repos, fn _owner -> {:ok, build_list(2, :repo_info)} end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, owner, []))
        |> json_response(:ok)

      assert %{
               "repos" => [
                 %{
                   "description" =>
                     "C Project Template with Makefile, based on: https://github.com/dutenrapha/makefile",
                   "html_url" => "https://github.com/librity/c_makefile_template",
                   "id" => 339_136_738,
                   "name" => "c_makefile_template",
                   "stargazers_count" => 1
                 },
                 %{
                   "description" =>
                     "C Project Template with Makefile, based on: https://github.com/dutenrapha/makefile",
                   "html_url" => "https://github.com/librity/c_makefile_template",
                   "id" => 339_136_738,
                   "name" => "c_makefile_template",
                   "stargazers_count" => 1
                 }
               ]
             } = response
    end

    test "returns an error if user doesn't exist", %{conn: conn} do
      bad_owner = "'"

      expect(GithubMock, :get_user_repos, fn _owner ->
        {:error, Error.build(:not_found, "Github user not found")}
      end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, bad_owner, []))
        |> json_response(:not_found)

      assert %{"message" => "Github user not found"} = response
    end
  end
end
