defmodule Mumbling do
  def accum(s) do
    [{letter, _} | letters] = String.upcase(s)
    |> String.graphemes()
    |> Enum.with_index()

    mumble(letters, letter)
  end

  def mumble([], acc), do: acc
  def mumble([{letter, i} | rest], acc) do
    string = acc <> "-" <> letter <> (String.downcase(letter) |> String.duplicate(i))

    mumble(rest, string)
  end
end
