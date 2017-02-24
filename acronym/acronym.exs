defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    words = String.split(string, ~r/(?![a-z,\-!@#$%^&])/)
    Enum.reduce(words, "", fn(word, acc) ->
       word
        |> String.trim
        |> String.upcase
        |> String.first
        |> (fn(word) -> acc <> (word || "") end).()
    end)
  end
end
