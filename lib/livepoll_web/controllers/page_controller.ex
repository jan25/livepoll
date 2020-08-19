defmodule LivepollWeb.PageController do
  use LivepollWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
