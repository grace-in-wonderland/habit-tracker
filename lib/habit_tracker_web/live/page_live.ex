defmodule HabitTrackerWeb.PageLive do
  use HabitTrackerWeb, :live_view

  def handle_event("start", _params, socket) do
    {:noreply, socket |> go}
  end

  defp go(socket) do
    push_redirect(socket, to: "/calendar")
  end

end
