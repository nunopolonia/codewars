defmodule Divisible13 do
  @remainders [1, 10, 9, 12, 3, 4]

  def thirt(n) do
    digits = Integer.digits(n) |> Enum.reverse
    remainders = Stream.cycle(@remainders)

    with ^n <- Enum.zip(digits, remainders) |> Enum.reduce(0, fn {x, y}, acc -> acc + (x * y) end)
    do
      n
    else
      number -> thirt(number)
    end
  end
end
