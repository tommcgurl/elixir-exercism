defmodule Bob do
  def hey(input) do
    cond do
        String.at(input, (String.length(input) - 1)) === "?" ->
          "Sure."
        String.trim(input) === "" ->
          "Fine. Be that way!"
        String.upcase(input) === input && String.downcase(input) !== String.upcase(input) ->
          "Whoa, chill out!"
        true ->
          "Whatever."
    end
  end
end
