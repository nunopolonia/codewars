defmodule Bus do
  def number(stops) do
    Enum.reduce(stops, 0, fn {x, y}, acc -> acc + x - y end)
  end
end
