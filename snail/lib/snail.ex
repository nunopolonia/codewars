defmodule Snail do
  def snail([h | t]) do
    h ++ (transpose(t) |> Enum.reverse |> snail)
  end
  def snail([]), do: []

  def transpose([[x | xs] | xss]) do
    [[x | (for [h | _] <- xss, do: h)] | transpose([xs | (for [_ | t] <- xss, do: t)])]
  end
  def transpose([[] | xss]), do: transpose(xss)
  def transpose([]), do: []
end
