defmodule PentabonacciTest do
  use ExUnit.Case

  def testing(numtest, n, ans) do
    IO.puts("Test #{numtest}")
    assert Pentabonacci.count_odd_pentaFib(n) == ans
  end

  test "count_odd_pentaFib" do
    testing(0, 5, 1)
    testing(1, 45, 15)
    testing(2, 68, 23)
    testing(3, 76, 25)
    testing(4, 100, 33)
    testing(5, 121, 40)
    testing(6, 1508, 503)
    testing(7, 2100, 699)
    testing(8, 3500, 1167)
    testing(9, 4200, 1399)
    testing(10, 7600, 2533)
    testing(11, 8555, 2851)
    testing(12, 9100, 3033)
    testing(13, 9999, 3333)
    testing(14, 15000, 4999)
    testing(15, 25000, 8333)
    testing(16, 44000, 14667)
  end

  #########
  defp count_odd_pentaFibaux(0, _, cnt) do
    cnt
  end
  defp count_odd_pentaFibaux(n, [a, b, c, d, e], cnt) do
    [x, y, z, t, u] = [b, c, d, e, a + b + c + d + e]
    if (rem(x, 2) == 1) do
      cnt = cnt + 1
    end
    count_odd_pentaFibaux(n - 1, [x, y, z, t, u], cnt)
  end

  def count_odd_pentaFib3226(n) when n < 7 do
    if (n == 0) do
      0
    else
      1
    end
  end
  def count_odd_pentaFib3226(n) do
    count_odd_pentaFibaux(n, [0, 1, 1, 2, 4], -1)
  end

  #########

  def randomtests(n) when n <= 0 do
    IO.puts "Finished!"
  end
  def randomtests(n) do
    k = 1000 + :random.uniform(9000)
    ans = count_odd_pentaFib3226(k)
    IO.puts("k #{k} solution #{ans}")
    testing(n, k, ans)
    randomtests(n - 1)
  end
  test "random" do
    :random.seed(:os.timestamp)
    randomtests(25)
  end
end
