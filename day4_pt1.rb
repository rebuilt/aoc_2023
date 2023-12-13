require 'byebug'

input = File.read('day4_input.txt').split("\n")

class Game
  def initialize(row)
    @winning_numbers = row.split(':')[1].split('|')[0].split(' ')
    @hand = row.split(':')[1].split('|')[1].split(' ')
  end

  def matches
    @hand.map do |number|
      @winning_numbers.include? number
    end
  end

  def score
    matches.filter(&:itself).reduce(1) do |product|
      product * 2
    end / 2
  end
end

sum = input.map do |row|
  Game.new(row).score
end.sum

puts sum
