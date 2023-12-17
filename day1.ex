defmodule Day1.Game do
  def input do
    path = "day1_input.txt"

    case File.read(path) do
      {:ok, content} -> content |> String.trim() |> String.split("\n")
      {:error, reason} -> IO.puts("Error reading file: #{reason}")
    end
  end

  def numbers do
    %{
      "0" => "0",
      "zero" => "0",
      "orez" => "0",
      "1" => "1",
      "one" => "1",
      "eno" => "1",
      "2" => "2",
      "two" => "2",
      "owt" => "2",
      "3" => "3",
      "three" => "3",
      "eerht" => "3",
      "4" => "4",
      "four" => "4",
      "ruof" => "4",
      "5" => "5",
      "five" => "5",
      "evif" => "5",
      "6" => "6",
      "six" => "6",
      "xis" => "6",
      "7" => "7",
      "seven" => "7",
      "neves" => "7",
      "8" => "8",
      "eight" => "8",
      "thgie" => "8",
      "9" => "9",
      "nine" => "9",
      "enin" => "9"
    }
  end

  def find_match(word, pattern) do
    numbers()[Regex.named_captures(pattern, word)["number"]]
  end

  def convert_to_number(row) do
    with pattern = ~r{(?<number>#{Enum.join(Map.keys(numbers()), "|")})},
         first_digit = find_match(row, pattern),
         last_digit = String.reverse(row) |> find_match(pattern) do
      String.to_integer(first_digit <> last_digit)
    end
  end

  def run do
    Game.input()
    |> Enum.map(&convert_to_number(&1))
    |> Enum.sum()
    |> Integer.to_string()
    |> IO.puts()
  end
end

Day1.Game.run()
