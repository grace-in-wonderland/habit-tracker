defmodule HabitTrackerWeb.HabitTrackerLive do
  use HabitTrackerWeb, :live_view
  alias HabitTracker.Month

  def mount(_params, _session, socket) do
    {:ok, assign(socket,
                    start: Month.starts_on(),
                    days: Month.days(),
                    marks: [])}
  end

  def render(assigns) do
    ~L"""
    <h1> Habit Tracker </h1>
    <%= inspect @marks %>
    <ul class="weekdays">
      <li>Su</li>
      <li>Mo</li>
      <li>Tu</li>
      <li>We</li>
      <li>Th</li>
      <li>Fr</li>
      <li>Sa</li>
    </ul>
    <ul class="days">
    <%= for blank <- (0..@start-1) do %>
    <li class="blank"></li>
    <% end %>
    <%= for date <- @days do %>
    <li class="day <%=today?(date)%> <%=marked?(date, @marks)%>">
    <a class="<%=marked?(date, @marks)%>" href="#" phx-click="mark" phx-value-date=<%=date%> >
      <%=date.day%>
      </a>
      </li>
    <% end %>
    """
  end

  defp today?(day) do
    if Date.utc_today == day, do: "active"
  end

  defp marked?(date, marks) do
    day = Date.to_string(date)
    if day in marks, do: "marked"
  end

  def handle_event("mark", %{"date" => day}, socket) do
    {:noreply, assign(socket, marks: [day | socket.assigns.marks])}
  end

end
