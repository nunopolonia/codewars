defmodule PrinterError do
  def printer_error(s) do
    "#{Regex.scan(~r/[n-z]+/, s) |> List.to_string |> String.length}/#{String.length(s)}"
  end
end
