defmodule StringUtilsTest do
  use ExUnit.Case
  import StringUtils, only: [digit?: 1, alter_case: 1]

  test "digit? basic cases" do
    assert digit?("") == false
    assert digit?("7") == true
    assert digit?(" ") == false
    assert digit?("a") == false
    assert digit?("a5") == false
    assert digit?("14") == false
  end

  test "digit? more cases" do
    assert digit?(" ") == false
    assert digit?("!") == false
    assert digit?("\"") == false
    assert digit?("#") == false
    assert digit?("$") == false
    assert digit?("%") == false
    assert digit?("&") == false
    assert digit?("'") == false
    assert digit?("(") == false
    assert digit?(")") == false
    assert digit?("*") == false
    assert digit?("+") == false
    assert digit?(",") == false
    assert digit?("-") == false
    assert digit?(".") == false
    assert digit?("/") == false
    assert digit?("0") == true
    assert digit?("1") == true
    assert digit?("2") == true
    assert digit?("3") == true
    assert digit?("4") == true
    assert digit?("5") == true
    assert digit?("6") == true
    assert digit?("7") == true
    assert digit?("8") == true
    assert digit?("9") == true
    assert digit?(":") == false
    assert digit?(";") == false
    assert digit?("<") == false
    assert digit?("=") == false
    assert digit?(">") == false
    assert digit?("?") == false
    assert digit?("@") == false
    assert digit?("A") == false
    assert digit?("B") == false
    assert digit?("C") == false
    assert digit?("D") == false
    assert digit?("E") == false
    assert digit?("F") == false
    assert digit?("G") == false
    assert digit?("H") == false
    assert digit?("I") == false
    assert digit?("J") == false
    assert digit?("K") == false
    assert digit?("L") == false
    assert digit?("M") == false
    assert digit?("N") == false
    assert digit?("O") == false
    assert digit?("P") == false
    assert digit?("Q") == false
    assert digit?("R") == false
    assert digit?("S") == false
    assert digit?("T") == false
    assert digit?("U") == false
    assert digit?("V") == false
    assert digit?("W") == false
    assert digit?("X") == false
    assert digit?("Y") == false
    assert digit?("Z") == false
    assert digit?("[") == false
    assert digit?("\\") == false
    assert digit?("]") == false
    assert digit?("^") == false
    assert digit?("_") == false
    assert digit?("`") == false
    assert digit?("a") == false
    assert digit?("b") == false
    assert digit?("c") == false
    assert digit?("d") == false
    assert digit?("e") == false
    assert digit?("f") == false
    assert digit?("g") == false
    assert digit?("h") == false
    assert digit?("i") == false
    assert digit?("j") == false
    assert digit?("k") == false
    assert digit?("l") == false
    assert digit?("m") == false
    assert digit?("n") == false
    assert digit?("o") == false
    assert digit?("p") == false
    assert digit?("q") == false
    assert digit?("r") == false
    assert digit?("s") == false
    assert digit?("t") == false
    assert digit?("u") == false
    assert digit?("v") == false
    assert digit?("w") == false
    assert digit?("x") == false
    assert digit?("y") == false
    assert digit?("z") == false
    assert digit?("{") == false
    assert digit?("|") == false
    assert digit?("}") == false
    assert digit?("~") == false
    assert digit?("1\n0") == false
    assert digit?("1\n") == false
    assert digit?("1 ") == false
    assert digit?(" 1") == false
    assert digit?("10") == false
    assert digit?("\n1") == false
  end

  test "digit? random cases" do
    1..40 |> Enum.each(fn _ ->
      str = Integer.to_string(:rand.uniform(1_000_000) + 10)
      assert digit?(str) == false, "Got true instead of false for `#{str}`"
    end)
  end

  test "alter_case basic cases" do
    assert alter_case("hello world") == "HELLO WORLD"
    assert alter_case("HELLO WORLD") == "hello world"
    assert alter_case("hello WORLD") == "HELLO world"
    assert alter_case("HeLLo WoRLD") == "hEllO wOrld"
    assert alter_case("12345") == "12345" # Non-alphabetical characters are unaffected
    assert alter_case("1a2b3c4d5e") == "1A2B3C4D5E"
    assert alter_case("StringUtils.toAlternatingCase") == "sTRINGuTILS.TOaLTERNATINGcASE"
    assert alter_case(alter_case("Hello World")) == "Hello World" # When method is called twice, should return original string
  end

  test "alter_case more basic cases" do
    assert alter_case("altERnaTIng cAsE") == "ALTerNAtiNG CaSe"
    assert alter_case("ALTerNAtiNG CaSe") == "altERnaTIng cAsE"
    assert alter_case("altERnaTIng cAsE <=> ALTerNAtiNG CaSe") == "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"
    assert alter_case("ALTerNAtiNG CaSe <=> altERnaTIng cAsE") == "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
  end

  defp random_string(str, num) do
    ssize = String.length(str)
    1..num
    |> Enum.map(fn _ ->
        index = :rand.uniform(ssize) - 1
        :binary.at(str, index)
       end)
    |> List.to_string
  end

  test "alter_case random cases" do
    lower = "abcdefghijklmnopqrstuvwxyz"
    middle = "~!@#$%^&*()_+-=[]\|;<>?"
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    body = fn _ ->
      begin = random_string(lower, :rand.uniform(10))
      middle = random_string(middle, :rand.uniform(10))
      finish = random_string(upper, :rand.uniform(10))
      word = begin <> middle <> finish
      answer = String.upcase(begin) <> middle <> String.downcase(finish)
      assert alter_case(word) == answer, "Got `#{alter_case(word)}` instead of `#{answer}` for the string: `#{word}`"
    end

    Enum.each(1..10, body)
  end
end
