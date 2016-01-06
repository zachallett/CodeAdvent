defmodule CodeAdvent.Mining do

  @key "iwrupvqb"

  def calculate_answer do
    lowest_md5(@key)
  end

  defp lowest_md5(key), do: lowest_md5(key, 0)

  defp lowest_md5(key, salt) do
    predigest = key <> Integer.to_string(salt)
    md5 = :crypto.hash(:md5, predigest) |> Base.encode16

    if Regex.match?(~r/^00000/, md5) do
      IO.puts "salt w/ 5 zeroes: #{salt}"
    end

    if Regex.match?(~r/^000000/, md5) do
      IO.puts "salt w/ 6 zeroes: #{salt}"
    else
      lowest_md5(key, salt + 1)
    end
  end

end
