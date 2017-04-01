defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  defp _rot([], _amount), do: []
  # Handle non letters
  defp _rot([head | tail], amount) when head > ?z or head < ?A or (head > ?Z and head < ?a), do: [head | _rot(tail, amount)]
  # Handle Capital letter wrapping.
  defp _rot([head | tail], amount) when head <= ?Z and head >= ?A and (head + amount) > ?Z do
    new_amount = (head + amount - 1) - ?Z
    [?A + new_amount | _rot(tail, amount)]
  end
  # Handle lower casee letter wrapping.
  defp _rot([head | tail], amount) when head >= ?a and (head + amount) > ?z do
    new_amount = (head + amount - 1) - ?z
    [?a + new_amount | _rot(tail, amount)]
  end
  # Handle all other scenarios
  defp _rot([head | tail], amount),do: [head + amount | _rot(tail, amount)]

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> String.to_charlist
      |> _rot(shift)
      |> to_string
  end
end
