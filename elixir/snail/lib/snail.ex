defmodule Snail do
  def snail([h | t]) do
    h ++ (transpose(t) |> Enum.reverse |> snail)
  end
  def snail([]), do: []

  def transpose(matrix) do
    matrix |> List.zip |> Enum.map(&Tuple.to_list(&1))
  end
end
