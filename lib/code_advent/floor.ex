defmodule CodeAdvent.Floor do

  def calculate do
    {:ok, file} = File.open("fixtures/floors.txt")
    instructions = IO.read(file, :all) |> String.strip
    find_floor(instructions)
  end

  defp find_floor(instructions), do: find_floor(instructions, 0)
  defp find_floor(<<"">>, level), do: level

  defp find_floor(<<"(", t :: binary>>, level), do: find_floor(t, level + 1)
  defp find_floor(<<")", t :: binary>>, level), do: find_floor(t, level - 1)

  def first_negative do
    {:ok, file} = File.open("fixtures/floors.txt")
    instructions = IO.read(file, :all) |> String.strip
    find_first_negative(instructions)
  end

  defp find_first_negative(instructions), do: find_first_negative(instructions, 0, 0)
  defp find_first_negative(_, -1, offset), do: offset
  defp find_first_negative(<<"">>, level, _), do: level

  defp find_first_negative(<<"(", t :: binary>>, level, offset), do: find_first_negative(t, level + 1, offset + 1)
  defp find_first_negative(<<")", t :: binary>>, level, offset), do: find_first_negative(t, level - 1, offset + 1)

end
