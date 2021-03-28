defmodule HabitTracker.Month do
  import Date

  def days do
    today = utc_today()
    first_day = beginning_of_month(today)
    last_day = end_of_month(today)
    range(first_day, last_day)
  end

  def starts_on do
    utc_today()
    |> beginning_of_month
    |> day_of_week
  end
end
