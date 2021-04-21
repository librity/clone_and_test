defmodule Github.Get do
  defmacro __using__(_opts) do
    quote do
      use Tesla

      alias CloneAndTest.Error
      alias Tesla.Env, as: Response

      alias Github.Get.RepoBehaviour
      alias Github.RepoInfo

      @request_headers [
        {"User-Agent", "CloneAndTest"}
      ]

      plug Tesla.Middleware.Headers, @request_headers
      plug Tesla.Middleware.JSON
    end
  end
end
