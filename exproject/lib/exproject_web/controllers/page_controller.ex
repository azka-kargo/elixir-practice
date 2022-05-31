defmodule ExprojectWeb.PageController do
  use ExprojectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
