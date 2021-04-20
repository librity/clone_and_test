defmodule CloneAndTestWeb.ReposViewTest do
  use CloneAndTestWeb.ConnCase, async: true

  import Phoenix.View
  import CloneAndTest.Factory

  alias CloneAndTestWeb.ReposView
  alias Github.RepoInfo

  test "renders repos.json" do
    repos = build_list(2, :repo_info)

    return = render(ReposView, "repos.json", repos: repos)

    assert %{
             repos: [
               %RepoInfo{
                 id: 339_136_738,
                 name: "c_makefile_template",
                 description:
                   "C Project Template with Makefile, based on: https://github.com/dutenrapha/makefile",
                 html_url: "https://github.com/librity/c_makefile_template",
                 stargazers_count: 1
               },
               %RepoInfo{
                 id: 339_136_738,
                 name: "c_makefile_template",
                 description:
                   "C Project Template with Makefile, based on: https://github.com/dutenrapha/makefile",
                 html_url: "https://github.com/librity/c_makefile_template",
                 stargazers_count: 1
               }
             ]
           } = return
  end
end
