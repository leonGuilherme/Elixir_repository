defmodule PipaBankWeb.PageController do
  use PipaBankWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
