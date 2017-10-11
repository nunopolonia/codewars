defmodule SalesmanTravel do
  def travel(r, zipcode) do
    [streets, numbers] = Enum.map(
      String.split(r, ","),
      &Regex.run(~r/(\d+)\s(.*)\s(\w{2}\s\d+)/,
      &1,
      capture: :all_but_first)
    ) |> Enum.group_by(
      fn [_, _, zipcode] -> zipcode end,
      fn [number, street, _] -> [street, number] end
    ) |> Map.get(zipcode) |> Enum.zip

    zipcode <> ":" <>
    Enum.join(Tuple.to_list(streets), ",") <> "/" <>
    Enum.join(Tuple.to_list(numbers), ",")
  end
end
