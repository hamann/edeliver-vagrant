defmodule Ed.PageController do
  use Ed.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
