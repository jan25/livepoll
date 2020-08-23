defmodule LivepollWeb.PollLive do
  use Phoenix.LiveView

  alias LivepollWeb.Router.Helpers, as: Routes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, code: nil, questions: [])}
  end

  def handle_params(params, _url, socket) do
    socket
    |> fetch(params["code"])
  end

  defp fetch(socket, code) do
    case code do
      "" -> goto_home(socket)
      nil -> goto_home(socket)
      _ -> 
        fetch_poll(socket, code)
    end
  end

  defp fetch_poll(socket, code) do
    # TODO fetch questions for code
    {:noreply, assign(socket, :code, code)}
  end

  defp goto_home(socket) do
    {:noreply, redirect(socket, to: Routes.home_path(socket, :index))}
  end

  def handle_event("upvote", params, socket) do
    IO.puts params
    {:noreply, socket}
  end
end