defmodule LivepollWeb.HomeLive do
  use Phoenix.LiveView

  alias LivepollWeb.Router.Helpers, as: Routes

  def mount(_params, _session, socket) do
    {:ok, assign(socket, code: nil, error: nil, stats: %{})}
  end

  def handle_event("create", %{"code" => code}, socket) do
    IO.puts elem(create_poll(code), 1)
    case create_poll(code) do
      {:ok, code} ->
        # TODO check if this creates dangling socket
        {:noreply, redirect(socket, to: Routes.poll_path(socket, :index, code: code))}
      {:error, reason} ->
        {:noreply, update(socket, :error, fn _ -> "#{reason}" end)}
      _ ->
        # TODO show good error messages
        {:noreply, assign(socket, :error, fn _ -> "Invalid code error" end)}
    end
  end

  defp create_poll(code) do
    IO.puts "code: #{code}"
    cond do
      code == "" ->
        {:error, "Code can not be empty"}
      code == "invalid" ->
        IO.puts "error case"
        {:error, "Code already in use"}
      true ->
        {:ok, code}    
    end
  end

end