defmodule BusTest do
  use ExUnit.Case
  import Bus, only: [number: 1]

  test "returns 0 for a bus without stops" do
    assert number([]) == 0
    assert number([{0,0}]) == 0
  end

  test "works for a bus with stops" do
    assert number([{10,0}, {3,5}, {5,8}]) == 5
    assert number([{3,0}, {9,1}, {4,10}, {12,2}, {6,1}, {7,10}]) == 17
    assert number([{3,0}, {9,1}, {4,8}, {12,2}, {6,1}, {7,8}]) == 21
  end

  defp solution(stops) do
    Enum.reduce(stops, 0, fn {inp, out}, n -> n - out + inp end)
  end

  test "random stops" do
    1..40 |> Enum.each(fn _ ->
      stops = [{:rand.uniform(30), 0}]
      more_stops = 1..(10 + :rand.uniform(20)) |> Enum.map(fn _ ->
        inp = :rand.uniform(30) - 1
        out = :rand.uniform(inp+1) - 1
        {inp, out}
      end)
      stops = stops ++ more_stops
      answer = solution(stops)
      assert number(stops) == answer,
        "Got #{number(stops)} instead of #{answer} " <>
        "for stops: #{inspect stops, limit: :infinity}"
    end)
  end
end
