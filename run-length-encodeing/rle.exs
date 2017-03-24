defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
      |> String.split("", trim: true)
      |> Enum.chunk_by(&(&1))
      |> Enum.map_join(fn([letter | _] = letter_list) ->
        cond do
          (Enum.count(letter_list) === 1) ->
            "#{letter}"
          letter === " " ->
            Enum.join letter_list
          true ->
            "#{Enum.count letter_list}#{letter}"
        end
      end)
  end

  @spec decode(String.t) :: String.t
  defp _duplicate(run_length) do
    if String.length(run_length) === 1 do
      run_length
    else
      [count, letter] = String.split(run_length, ~r/[a-zA-Z]/, include_captures: true, trim: true)
      letter
        |> String.duplicate(String.to_integer(count))
    end
  end
  def decode(string) do
    String.split(string, ~r/\d*.{1}/, include_captures: true, trim: true)
      |> Enum.map_join(fn(next_run_lenth) ->
        _duplicate(next_run_lenth)
      end)
  end
end
