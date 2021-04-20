defmodule CloneAndTestWeb.FallbackController do
  use CloneAndTestWeb, :controller

  alias CloneAndTest.Error
  alias CloneAndTestWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
