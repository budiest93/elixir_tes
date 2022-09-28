# budi
defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    cond do
      String.replace(input, ~r/[\s\t\n]/, "") == "" ->
        "Fine. Be that way!"
      String.upcase(input) == input and String.downcase(input) != input ->
        case String.ends_with?(input, "?") do
          true -> "Calm down, I know what I'm doing!"
          _ -> "Whoa, chill out!"
        end
      String.ends_with?(input, "?") ->
        "Sure."
      true -> "Whatever."
    end
  end
end
