defmodule VowelCount do
  def get_count(str) do
    length(Regex.scan(~r/[aeiou]/i, str))
  end
end
