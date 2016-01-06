defmodule CodeAdvent.Paper do

  def calculate_wrapping_paper do
    {:ok, file} = File.open("fixtures/wrapping_paper.txt")
    dimensions = IO.read(file, :all) |> String.strip |> String.split("\n")
    surface_area(dimensions)
  end

  defp surface_area(dimensions), do: surface_area(dimensions, 0)
  defp surface_area([], total), do: total

  defp surface_area([dimension|tail], total) do
    [length, width, height] = cast_to_int(dimension)
    area = calc_surface_area(length, width, height)
    surface_area(tail, total + area)
  end

  defp calc_surface_area(length, width, height) do
    side1 = length*width
    side2 = width*height
    side3 = height*length

    (2*side1) + (2*side2) + (2*side3) + (Enum.sort([side1, side2, side3]) |> List.first)
  end

  def calculate_ribbon do
    {:ok, file} = File.open("fixtures/wrapping_paper.txt")
    dimensions = IO.read(file, :all) |> String.strip |> String.split("\n")
    total_ribbon(dimensions)
  end

  def total_ribbon(dimensions), do: total_ribbon(dimensions, 0)
  defp total_ribbon([], total), do: total

  defp total_ribbon([dimension|tail], total) do
    [length, width, height] = cast_to_int(dimension)

    ribbon = volume(length, width, height) + perimeter(length, width, height)

    total_ribbon(tail, total + ribbon)
  end

  defp volume(length, width, height) do
    length*width*height
  end

  defp perimeter(length, width, height) do
    [side1, side2] = Enum.sort([length, width, height]) |> Enum.take(2)
    (2*side1) + (2*side2)
  end

  defp cast_to_int(dimension) do
    Regex.split(~r/x/, dimension) |> Enum.map(fn x -> String.to_integer(x) end)
  end


end
