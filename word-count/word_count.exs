defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  defp _count([], map), do: map
  defp _count([ "" | tail ], map), do: _count(tail, map)
  defp _count([head | tail], map) do
    # Normalize the string.
    head = String.downcase head;
    new_val = map[head] || 0
    new_map = Map.put map, head, (new_val + 1)
    _count(tail, new_map)
  end
  def count(sentence) do
    string_list = String.split sentence, ~r/[\s,_!@#$%^&:]/
    _count(string_list, %{})
  end
end
