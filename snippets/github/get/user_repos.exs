Github.get_user_repos("teamon")
Github.get_user_repos("danilo-vieira")
Github.get_user_repos("librity")
Github.get_user_repos(" ")
Github.get_user_repos("")

{:ok, [head | tails]} = Github.get_user_repos("librity")
head |> IO.inspect(limit: :infinity)
