defmodule Pentabonacci do
  import Integer, only: [is_odd: 1]

  def count_odd_pentaFib(n) do
    Enum.count(fib_terms(n), &is_odd(&1)) - 1
  end

  def fib_terms(n), do: fib_terms(n, 1, [0, 0, 0, 0, 0])
  def fib_terms(0, _, acc), do: acc
  def fib_terms(n, next, acc), do: fib_terms(n-1, sum_5([next]++acc), [next]++acc)

  def sum_5(list), do: Enum.take(list, 5) |> Enum.sum
end
