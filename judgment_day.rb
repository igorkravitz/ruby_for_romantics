# frozen_string_literal: true

# Задание: реализуйте метод “check_victory?” (сейчас он просто возвращает значение
# false). В случае победы или поражения необходимо выводить полученный результат на
# экран. Измените 10_000 на 10 чтобы легче было отлаживать программу.

# Задание: посмотрите документацию к "ruby case statements" и замените конструкцию
# "if...elsif" на "case...when".

# Задание: сделать так, чтобы цикл был теоретически бесконечным. Т.е. чтобы
# равновероятно на свет появлялись люди и машины. Количество появившихся людей или
# машин должно равняться количеству погибших людей или машин. Несмотря на то, что
# теоретически борьба может быть бесконечной, на практике может наступить ситуация, в
# которой та или иная сторона выигрывает. Проверьте программу на практике, попробуйте
# разные значения `humans` и `machines` (1000, 100, 10).

# Задание: улучшите программу, добавьте как минимум еще 3 события, которые могут
# влиять на результат судного дня.

########################################
# ОПРЕДЕЛЯЕМ ПЕРЕМЕННЫЕ
########################################
@humans = 10
@machines = 10
########################################
# ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
########################################
# Метод возвращает случайное значение: true или false
def luck?
  rand(0..1) == 1
end

def boom
  diff = rand(1..5)
  if luck?
    diff = diff > @machines ? @machines : diff
    @machines -= diff
    puts "#{diff} машин уничтожено"
  else
    diff = diff > @humans ? @humans : diff
    @humans -= diff
    puts "#{diff} людей погибло"
  end
  if luck?
    @machines += diff
    puts "#{diff} машин создано"
  else
    @humans += diff
    puts "#{diff} людей родилось"
  end
end

def tornado
  diff = rand(1..5)
  diff = [diff, @machines, @humans].min
  @machines -= diff
  puts "#{diff} машин уничтожено"
  @humans -= diff
  puts "#{diff} людей погибло"
end

def reinforcement
  diff = rand(1..5)
  @humans += diff
  puts "#{diff} людей пришло на помощь"
end

def reduplication
  diff = @machines
  @machines += diff
  puts "#{diff} машин создано"
end

# Метод возвращает случайное название города
def random_city
  dice = rand(1..5)
  case dice
  when 1
    "Москва"
  when 2
    "Лос-Анджелес"
  when 3
    "Пекин"
  when 4
    "Лондон"
  else
    "Сеул"
  end
end

def random_sleep
  sleep rand(0.3..1.5)
end

def stats
  # puts "Осталось #{@humans} людей и #{@machines} машин"
  puts "Осталось"
  puts "машин:#{'🤖' * @machines}"
  puts "людей:#{'👨' * @humans}"
end

########################################
# СОБЫТИЯ
########################################
def event1
  puts "Запущена ракета по городу #{random_city}"
  random_sleep
  boom
end

def event2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  random_sleep
  boom
end

def event3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  random_sleep
  boom
end

def event4
  puts "Прошёл ураган в городе #{random_city}"
  random_sleep
  tornado
end

def event5
  puts 'Из другой страны пришла помощь'
  random_sleep
  reinforcement
end

def event6
  puts 'Открылся завод роботов. Количество роботов удвоилось'
  random_sleep
  reduplication
end

########################################
# ПРОВЕРКА ПОБЕДЫ
########################################
def check_victory?
  @machines <= 0
end

def check_loss?
  @humans <= 0
end
########################################
# ГЛАВНЫЙ ЦИКЛ
########################################
system "clear"
loop do
  stats
  if check_victory?
    puts "Победа! Человечество победило. Осталось #{@humans} человек."
    exit
  elsif check_loss?
    puts "Проигрыш! Человечество проиграло. Осталось #{@machines} машин."
    exit
  end
  dice = rand(1..6)
  case dice
  when 1
    event1
  when 2
    event2
  when 3
    event3
  when 4
    event4
  when 5
    event5
  when 6
    event6
  end
  random_sleep
  system "clear"
end
