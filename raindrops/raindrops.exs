defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  defp _pling(0), do: "Pling"
  defp _pling(_), do: ""
  defp _plang(0), do: "Plang"
  defp _plang(_), do: ""
  defp _plong(0), do: "Plong"
  defp _plong(_), do: ""
  defp _number("", number), do: to_string number
  defp _number(rain, _number), do: rain
  def convert(number) do
    _pling(rem(number, 3)) <> _plang(rem(number, 5)) <> _plong(rem(number, 7))
      |> _number(number)
  end


end
