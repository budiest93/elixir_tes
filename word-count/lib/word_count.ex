# budi
defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/[^À-žA-Za-z0-9-']/, " ")
    |> String.downcase()
    |> String.split()
    |> Enum.map(fn word -> String.trim(word, "'") end)
    |> Enum.frequencies()
  end
end
