require 'byebug'

input = File.read('day2_input.txt').split("\n")

class Game
  attr_reader :row, :sets, :max_values, :required_cubes, :picks

  def initialize(row, max_values)
    @max_values = max_values
    @row = row
    @sets = @row.split(':').last.split(';')
    @picks = @sets.map { |set| set.split(',').map(&:strip) }.flatten
    @required_cubes = {}
  end

  def power
    picks.each do |pick|
      set_power(pick)
    end
    required_cubes.values.reduce(1) { |product, n| product * n }
  end

  def set_power(pick)
    number, color = pick.strip.split(' ')
    number = number.to_i
    required_cubes[color] = number if required_cubes[color].nil? || number > required_cubes[color]
  end
end

max_values = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}

power = input.map do |row|
  game = Game.new(row, max_values)
  game.power
end.sum

puts power
