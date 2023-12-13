require 'byebug'

input = File.read('day1_input.txt').split("\n")

NUMBERS = {
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

def find_match(word)
  word.match(/(#{NUMBERS.keys.join("|")})/i).captures[0]
end

output = input.map do |row|
  first_digit = NUMBERS[find_match(row)]
  last_digit =  NUMBERS[find_match(row.reverse)]
  first_digit + last_digit
end.map(&:to_i).sum

puts output
