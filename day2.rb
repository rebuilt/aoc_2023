require 'byebug'

input = File.read('day2_input.txt').split("\n")

class Game
  attr_reader :row, :sets, :max_values, :id, :picks

  def initialize(row, max_values)
    @max_values = max_values
    @row = row
    @sets = @row.split(':').last.split(';')
    @picks = @sets.map { |set| set.split(',').map(&:strip) }.flatten
    @id = @row.match(/Game\s+(\d*)/i).captures[0].to_i
  end

  def to_i
    id
  end

  def valid?
    picks.all? do |pick|
      valid_pick?(pick)
    end
  end

  def valid_pick?(pick)
    number, color = pick.strip.split(' ')
    number = number.to_i
    number <= max_values[color]
  end
end

max_values = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}

sum = input.map do |row|
  game = Game.new(row, max_values)
  next game.to_i if game.valid?

  0
end.sum

puts sum
