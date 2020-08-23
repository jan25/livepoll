defmodule LivepollWeb.HomeLive do
  use LivepollWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :counter, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :counter, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div>
      <button phx-click="dec">-</button>
      <span><%= @counter %></span>
      <button phx-click="inc">+</button>
    </div>
    """
  end
    
end