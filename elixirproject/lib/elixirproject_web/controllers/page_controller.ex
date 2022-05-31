defmodule ElixirprojectWeb.PageController do
  use ElixirprojectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
