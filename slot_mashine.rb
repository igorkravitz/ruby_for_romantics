# frozen_string_literal: true

# Задание: определите метод, который будет вычислять случайный номер с анимацией
# (используйте sleep со случайной задержкой). Примените анимацию к переменным “x”, “y”,
# “z”.
#
# Задание: добавьте больше условий в игру “Однорукий бандит”, используйте свое
# воображение.
#
# Задание: (если вы используете MacOS) вместо цифр в консоли используйте эмодзи.
# Пусть каждой цифре соответствует определенная картинка. Вы можете найти эмодзи на
# сайте https://emojipedia.org/.

system "clear"
print "Ваш возраст: "
age = gets.to_i
# age = 18
if age < 18
  puts "Сожалеем, но вам нет 18"
  exit
end
balance = 20
first = true
key = ''
loop do
  system "clear"
  puts "Нажмите Enter, чтобы дернуть ручку... (или любую клавишу, чтобы выйти из игры)"
  puts "Ваш баланс: #{balance} $"
  if balance.zero?
    puts "Попробуйте в другой раз"
    exit
  end
  if first
    key = gets.chomp
    first = false
  end
  # key = ""
  exit unless key.empty?
  array__picture = %w[🍋 🍒 🍓 🍇 🔔 💰]
  x = 0
  y = 0
  z = 0
  10.times do |_|
    x = rand(0..5)
    y = rand(0..5)
    z = rand(0..5)
    print "\r\r\r\r\r#{array__picture[x]} #{array__picture[y]} #{array__picture[z]}"
    sleep 0.3
  end
  print "\n"
  if x.zero? && y.zero? && z.zero?
    balance = 0
    puts "Ваш баланс обнулен"
    exit
  elsif x == 3 && y == 3 && z == 3
    balance += 10
    puts "Баланс увеличился на 10 $"
  elsif x == 4 && y == 4 && z == 4
    balance += 20
    puts "Баланс увеличился на 20 $"
  elsif x == 5 && y == 5 && z == 5
    balance += 30
    puts "Баланс увеличился на 30 $"
  elsif x == 3 && y == 4 && z == 5
    diff = rand(1..10)
    balance += diff
    puts "Баланс увеличился на случайное число 1..10: #{diff} $"
  elsif x.zero? && y == 1 && z == 2
    diff = rand(1..10)
    balance -= diff > balance ? balance : diff
    puts "Баланс уменьшился на случайное число 1..10: #{diff} $"
  else
    balance -= 0.5
    puts "Баланс уменьшился на 0.50 $"
  end
  key = gets.chomp
end
