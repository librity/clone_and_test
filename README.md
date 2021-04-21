# CloneAndTest

## Table of Contents

- [About](#about)
- [Endpoints](#endpoints)
- [Setup](#setup)
- [Bash Commands](#bash_commands)
- [Elixir Commands](#elixir_commands)
- [Libs](#libs)
- [Docs](#docs)
- [Resources](#resources)

## About <a name = "about"></a>

A Pheonix backend that clones arbitrary elixir project,
runs ExUnit tests and saves the result to a database.

## Endpoints <a name = "endpoints"></a>

Built-in:

- `GET` http://localhost:4000/dashboard

`Repos`

- `GET` http://localhost:4000/api/repos/:owner
- `GET` http://localhost:4000/api/repos/:owner/:repo_name

## Setup <a name = "setup"></a>

Install `Erlang`, `Elixir` and `Phoenix`.

## Bash Commands <a name = "bash_commands"></a>

```bash
# Create phoenix app without webpacker or html views
$ mix phx.new app_name --no-webpack --no-html

# Intall dependencies
$ mix deps.get

# Compile project
$ mix compile

# Generate linter config file
$ mix credo.gen.config

# Run linter
$ mix credo --strict

# Start Phoenix dev server on http://localhost:4000
$ mix phx.server

# Start your project as an Interactive Elixir session
$ iex -S mix

# List all configured routes
$ mix phx.routes
```

Tests

```bash
# Run tests
$ mix test

# Run tests w/ coverage report
$ mix test --cover
```

## Elixir Commands <a name = "elixir_commands"></a>

Shell commands:

```elixir
System.cmd("whoami", [])
System.cmd("echo", ["hello"], into: IO.stream(:stdio, :line))
```

Github client:

```elixir
Github.get_user_repos("teamon")
Github.get_user_repos("danilo-vieira")
Github.get_user_repos("librity")
```

```elixir
Github.get_repo("octokit", "octokit.rb")
Github.get_repo("elixir-lang", "elixir")
Github.get_repo("librity", "librity")
```

Elixir Git CLI:

```elixir
{:ok, repo} = Git.clone "https://github.com/librity/librity"
Git.remote repo, ~w(add upstream https://git.example.com)
Git.pull repo, ~w(--rebase upstream master)
Git.diff repo, "HEAD~1"
Git.add repo, "."
Git.commit repo, ["-m" "my message"]
Git.push repo
IO.puts Git.log!(repo)
```

## Libs <a name = "libs"></a>

- https://github.com/phoenixframework/phoenix
- https://github.com/teamon/tesla
- https://github.com/PSPDFKit-labs/bypass
- https://github.com/dashbitco/mox
- https://github.com/thoughtbot/ex_machina
- https://github.com/danhper/elixir-git-cli
- https://github.com/proger/erlsh
- https://github.com/devinus/sh

## Docs <a name = "docs"></a>

- https://elixir-lang.org/crash-course.html
- https://hexdocs.pm/elixir/master/Path.html
- https://hexdocs.pm/git_cli/api-reference.html
- https://hexdocs.pm/elixir/master/System.html
- https://hexdocs.pm/elixir/master/File.html
- https://hexdocs.pm/elixir/master/Code.html

## Resources <a name = "resources"></a>

- https://www.tutorialspoint.com/elixir/elixir_lists_and_tuples.htm
- https://stackoverflow.com/questions/29566248/how-to-use-io-inspect-on-a-long-list-without-trimming-it
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
- https://stackoverflow.com/questions/22594988/run-shell-commands-in-elixir
- https://stackoverflow.com/questions/27688940/executing-a-basic-shell-command-in-elixir

### Git and Github

- https://docs.github.com/en/rest
- https://stackoverflow.com/questions/57669037/how-to-clone-github-repo-using-node-js
- https://github.com/shelljs/shelljs
- https://www.npmjs.com/package/git-clone
- https://github.com/octokit/octokit.js
- https://stackoverflow.com/questions/28491306/elixir-use-vs-import

### Test repos

- https://github.com/librity/nlw4_elixir
- https://github.com/librity/ignite_list_filter
- https://github.com/librity/ignite_rockelivery
- https://github.com/librity/ignite_queue
- https://github.com/librity/ignite_jwt_ttl
- https://github.com/librity/ignite_repo_tests
- https://github.com/librity/ignite_nutri_entities
- https://github.com/librity/ignite_flightex_tests
- https://github.com/librity/ignite_concurrent_report
- https://github.com/librity/nlw5_elixir
- https://github.com/librity/todo_in_action
- https://github.com/librity/ignite_rockelivery
- https://github.com/raulpe7eira/rp7pay
