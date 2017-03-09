defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  # When lists are the same.
  def compare(a, a), do: :equal
  # Look for a sublist.
  def compare(a, b) when length(a) <= length(b) do
    _is_sublist(a, b, a, b)
  end
  # Look for a superlist.
  def compare(a, b) when length(a) > length(b) do
    _is_superlist(a, b, a, b)
  end

  # Both _is_sublist and _is_superlist take the original lists as arguments.
  # This is so that we can start over at anypoint in the recursion with the original lists.
  # For example let's say A = [1, 1, 3] and B = [1, 1, 1, 3]
  # You would compare 1 with 1, then 1 with 1 , then 3 with 1.
  # Since 3 !== 1 we want to start again from the beginning of A (1 in this case) and starting
  # from the "tail" of B which in this case is [1, 1, 3]
  defp _is_sublist([], _b, _a2, _b2), do: :sublist
  defp _is_sublist(_a, [], _a2, _b2), do: :unequal
  defp _is_sublist([ah | atail], [bh | btail], a, b) when ah === bh, do: _is_sublist(atail, btail, a, b)
  defp _is_sublist([ah | _atail], [bh | _btail], a, [_bh2 | btail2]) when ah !== bh, do: _is_sublist(a, btail2, a, btail2)

  defp _is_superlist(_a, [], _a2, _b2), do: :superlist
  defp _is_superlist([], _b, _a2, _b2), do: :unequal
  defp _is_superlist([ah | atail], [bh | btail], a, b) when ah === bh, do: _is_superlist(atail, btail, a, b)
  defp _is_superlist([ah | _atail], [bh | _btail], [_ah2 | atail2], b) when ah !== bh, do: _is_superlist(atail2, b, atail2, b)
end
