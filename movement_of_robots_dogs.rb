# frozen_string_literal: true

require 'pry'

# Задание: удалите все комментарии в программе выше. Способны ли вы разобраться в
# том, что происходит?
# Задание: добавьте на поле еще 3 собаки.
# Задание: исправьте программу: если все собаки дошли до правого или нижнего края
# поля, выводить на экран “Win!”
#
class Robot
  attr_accessor :x, :y

  def initialize(options = {})
    @x = options[:x] || 0
    @y = options[:y] || 0
  end

  def right
    self.x += 1
  end

  def left
    self.x -= 1
  end

  def up
    self.y += 1
  end

  def down
    self.y -= 1
  end

  def label
    "*"
  end
end

# Class describe dogs
class Dog
  attr_accessor :x, :y

  def initialize(options = {})
    @x = options[:x] || 0
    @y = options[:y] || 0
  end

  def right
    self.x += 3
  end

  def left; end

  def up; end

  def down
    self.y -= 3
  end

  def label
    "@"
  end
end

# class describe Commander
class Commander
  def move(who)
    m = %i[right left up down].sample
    who.send(m)
  end
end
commander = Commander.new
arr = Array.new(10) { Robot.new }
3.times { arr.push(Dog.new(x: -12, y: 12)) }
loop do
  puts "\e[H\e[2J"
  12.downto(-12) do |y|
    -12.upto(12) do |x|
      somebody = arr.find { |item| item.x == x && item.y == y }
      # binding.pry
      if somebody
        print somebody.label
      else
        print "."
      end
    end
    puts
  end
  game_over =
    arr
    .combination(2)
    .any? { |a, b| a.x == b.x && a.y == b.y && a.label != b.label }
  if game_over
    puts 'Game over'
    exit
  end
  win = arr.any? { |item| item.label == '@' && (item.x >= 12 || item.y <= -12) }
  if win
    puts 'Win!'
    exit
  end
  arr.each { |somebody| commander.move(somebody) }
  sleep 0.5
end
