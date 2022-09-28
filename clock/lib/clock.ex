# budi
defmodule Clock do
  defstruct hour: 0, minute: 0
  defguard hour?(input) when is_integer(input) and input >= 0 and input < 24
  defguard minute?(input) when is_integer(input) and input >= 0 and input < 60
  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) when minute < 0, do: new(hour - 1 + div(minute,60), rem(minute,60) + 60)
  def new(hour, minute) when hour < 0, do: new(rem(hour,24) + 24, minute)
  def new(hour, minute) when minute > 59, do: new(hour + div(minute,60), rem(minute,60))
  def new(hour, minute) when hour > 23, do: new(rem(hour,24), minute)
  def new(hour, minute) when hour?(hour) and minute?(minute), do: %Clock{hour: hour, minute: minute}
  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute), do: new(hour,minute + add_minute)
  defimpl String.Chars, for: Clock do
    defp l0(number, count \\ 2), do: number |> Integer.to_string |> String.pad_leading(count, "0")
    @spec to_string(Clock) :: String.t()
    def to_string(%Clock{hour: hour, minute: minute}), do: "#{l0(hour)}:#{l0(minute)}"
  end
end
