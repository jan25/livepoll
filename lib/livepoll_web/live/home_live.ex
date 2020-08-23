defmodule LivepollWeb.HomeLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, code: nil, stats: %{})}
  end

  def handle_event("create", %{"code" => code}, socket) do
    {:noreply, assign(socket, code: code)}
  end

end