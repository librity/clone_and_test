defmodule CloneAndTestWeb.ReposController.CreateTest do
  use CloneAndTestWeb.ConnCase, async: true

  import Mox
  import CloneAndTest.Factory

  alias CloneAndTest.Error
  alias Github.ClientMock

  describe "create/2" do
    test "returns user's repos if user exists", %{conn: conn} do
      username = "librity"

      expect(ClientMock, :get_user_repos, fn _username -> {:ok, build_list(2, :repo_info)} end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, username, []))
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
      bad_username = "'"

      expect(ClientMock, :get_user_repos, fn _username ->
        {:error, Error.build(:not_found, "Github user not found")}
      end)

      response =
        conn
        |> get(Routes.repos_path(conn, :show, bad_username, []))
        |> json_response(:not_found)

      assert %{"message" => "Github user not found"} = response
    end
  end
end
