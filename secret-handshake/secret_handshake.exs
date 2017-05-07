defmodule SecretHandshake do
  # We can use bitwise to check agains 0b11111 which is 31
  @checker 31
  # Pattern matching for the win!!!!
  defp _wink(0), do: []
  defp _wink(1), do: ["wink"]
  defp _double_blink(0), do: []
  defp _double_blink(1), do: ["double blink"]
  defp _close_your_eyes(0), do: []
  defp _close_your_eyes(1), do: ["close your eyes"]
  defp _jump(0), do: []
  defp _jump(1), do: ["jump"]


  defp _get_handshake([z]), do: _wink(z)
  defp _get_handshake([y, z]), do:  _wink(z) ++ _double_blink(y)
  defp _get_handshake([w, y, z]), do:  _wink(z) ++ _double_blink(y) ++ _close_your_eyes(w)
  defp _get_handshake([v, w, y, z]), do: _wink(z) ++ _double_blink(y) ++ _close_your_eyes(w) ++ _jump(v)
  defp _get_handshake([1, v, w, y, z]), do: _jump(v) ++ _close_your_eyes(w) ++ _double_blink(y) ++ _wink(z)

  @doc """
    Determine the actions of a secret handshake based on the binary
    representation of the given `code`.

    If the following bits are set, include the corresponding action in your list
    of commands, in order from lowest to highest.

    1 = wink
    10 = double blink
    100 = close your eyes
    1000 = jump

    10000 = Reverse the order of the operations in the secret handshake
    """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    use Bitwise, only_operators: true
    (@checker &&& code)
      |> Integer.digits(2)
      |> _get_handshake()
  end
end
