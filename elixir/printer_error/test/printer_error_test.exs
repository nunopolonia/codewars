defmodule PrinterErrorTest do
  use ExUnit.Case

  defp testing(numtest, s, ans) do
    IO.puts("Test #{numtest} \n")
    assert PrinterError.printer_error(s) == ans
  end

  test "printer_error" do
    s = "aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"
    testing(1, s, "3/56")
    s = "kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"
    testing(2, s, "6/60")
    s = "kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyzuuuuu"
    testing(3, s, "11/65")
    s = "ijacfcmkedbgefaierflkijalbdckfci"
    testing(4, s, "1/32")
    s = "jdmimmgfghljgjbiefadmljlefcflibiherejejmjbacjcldhjltgb"
    testing(5, s, "2/54")
    s = "gbkhlffbalhajehlmkhbjjigjmcchikmicucicfggelkmaehelisgg"
    testing(6, s, "2/54")
    s = "kkmlbgfmhkcfihbggdhmecfjgkgabichhazgdchibcmilfikjcgulmkcab"
    testing(7, s, "2/58")
    s = "bgalbhlgkfebedblemficfjmgmhaddgjccomaiflmc"
    testing(8, s, "1/42")
  end

  #########
  defp printer_error076(s) do
    a = String.replace(s, ~r/[n-z]/, "", global: true)
    "#{String.length(s) - String.length(a)}/#{String.length(s)}"
  end
  defp get_string(len) do
    alpha =  "abcdefghijklmnopqrstuvwxyz"
    alpha_len = alpha |> String.length
    1..len |> Enum.map_join(fn(_) -> alpha |> String.at(:random.uniform( alpha_len) - 1) end)
  end
  #########

  defp randomtests(n) when n <= 0 do
    IO.puts "Finished!"
  end
  defp randomtests(n) do
    s = get_string(10 + :random.uniform(200))
    ans = printer_error076(s)
    IO.puts("string #{s} \n --> solution : #{ans}")
    testing(n + 8, s, ans)
    randomtests(n - 1)
  end
  test "random" do
    :random.seed(:os.timestamp)
    randomtests(200)
  end

end
