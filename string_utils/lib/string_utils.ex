defmodule StringUtils do
  import Bitwise, only: [bxor: 2]

  def digit?(s) do
    Regex.match?(~r/\A\d\z/, s)
  end

  def alter_case(str) do
    charlist = to_charlist(str)

    to_string(invert_case(charlist, []))
  end

  def invert_case([], acc), do: acc
  def invert_case([letter | rest], acc) do
    if letter in 65.. 90 or letter in 97..122 do
      invert_case(rest, acc ++ [bxor(letter, 32)])
    else
      invert_case(rest, acc ++ [letter])
    end
  end
end
