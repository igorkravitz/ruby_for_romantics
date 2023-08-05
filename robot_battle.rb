# frozen_string_literal: true

# Задание:  написать простейшую игру "битва роботов". Возьмем
# 20 роботов и разделим их на 2 команды, в каждой команде по 10. Каждую команду будет
# представлять отдельный массив размером 10. Ячейка массива может принимать два
# значения:
# ● Ноль - когда робот уничтожен
# ● Единица - когда робот еще жив
# Объявим два массива. Единица говорит о том, что мы объявляем массивы с живыми
# роботами:
# ```
# arr1 = Array.new(10, 1)
# arr2 = Array.new(10, 1)
# ```
# Каждые команды будут стрелять по-очереди. Определимся с термином “стрелять”, что это
# значит? Если ноль в массиве это уничтоженный робот, а единица - живой, то стрелять
# значит “изменить значение с единицы на ноль для определенной ячейки массива”. Но как
# мы будем определять какую ячейку менять? Тут есть два варианта:
# Намного интереснее выбирать индекс от 0 до 9 каждый раз случайно. Случайность
# не гарантирует того, что индекс не повторится. Поэтому одна команда может
# "стрельнуть" по одному и тому же месту. Например, через пять ходов вторая
# команда бьет в пятую ячейку, а выстрел по ней уже был до этого. Следовательно,
# выстрел не попал в цель, ячейка уже равна нулю, и количество убитых роботов не
# изменилось. Т.е. результат сражения заранее не гарантирован и зависит от
# везения.
# Дополнительное развитие. Вместо 1 эмодзи роботов и людей отображать блок 4 х 4 эмодзи
# и при ударе уничтожать случайное количество 1..16 эмодзи из блока. В дальнейшем отображать
# весь блок 4 х 4 но без потерянных эмодзи
module RobotBattle
  def self.start_game
    system "clear"
    robots = Array.new(10, 1)
    humans = Array.new(10, 1)
    arr_emoji = %w[🤖 👨]
    loop do
      rand_index = rand(0..9)
      1.upto(9) do |line_number|
        robots.each { |item| print(item.zero? ? "  " : arr_emoji[0]) }
        1.upto(8) do |empty_line_number|
          print %(\n#{'  ' * rand_index}#{empty_line_number == line_number ? '⚽' : ''})
        end
        print "\n"
        humans[rand_index] = 0 if line_number == 9
        humans.each_index do |index|
          unit = if humans[index].zero? && line_number == 9 && index == rand_index
                   '⚽'
                 elsif humans[index].zero?
                   '  '
                 else
                   arr_emoji[1]
                 end
          print unit
        end
        sleep 0.3
        system 'clear'
      end

      if humans.sum.zero?
        puts "Роботы победили"
        break
      end
      if robots.sum.zero?
        puts "Люди победили"
        break
      end

      rand_index = rand(0..9)
      9.downto(0) do |line_number|
        robots[rand_index] = 0 if line_number.zero?
        robots.each_index do |index|
          unit = if robots[index].zero? && line_number.zero? && index == rand_index
                   '⚽'
                 elsif robots[index].zero?
                   '  '
                 else
                   arr_emoji[0]
                 end
          print unit
        end
        1.upto(8) do |empty_line_number|
          print %(\n#{'  ' * rand_index}#{empty_line_number == line_number ? '⚽' : ''})
        end
        print "\n"
        humans.each { |item| print(item.zero? ? "  " : arr_emoji[1]) }
        sleep 0.3
        system 'clear'
      end
      if humans.sum.zero?
        puts "Роботы победили"
        break
      end
      if robots.sum.zero?
        puts "Люди победили"
        break
      end
      sleep 0.3
      system "clear"
    end
  end
end

RobotBattle.start_game
