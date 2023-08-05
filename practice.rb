# frozen_string_literal: true

require "pry"
# require 'json'
require "awesome_print"

# class for grupping digits
module Format
  def self.group_digits(number)
    number.to_s.reverse.scan(/.{1,3}/).join(" ").reverse
  end
end

# Задание: известно, что стоимость дома - 500 тысяч долларов. Человек берет дом в
# рассрочку на 30 лет. Чтобы выплатить дом за 30 лет, нужно платить 16666 долларов в год
# (это легко посчитать, разделив 500 тысяч на 30). Написать программу, которая для
# каждого года выводит сумму, которую осталось выплатить.
#
# Задание: измените программу из предыдущего задания со следующими условиями:
# человек берет дом не в рассрочку, а в кредит по ставке 4% годовых на оставшуюся сумму.
# Для каждого года посчитайте, сколько денег нужно заплатить за этот год за использование
# кредита.
#
# Задание: посчитайте количество денег (total), которые мы заплатим только в виде
# процентов по кредиту за 30 лет.
#
module BlocksNParameters
  def self.annual_payment
    puts "Введите год покупки дома в рассрочку"
    year = gets.to_i
    # year = 2023
    # puts year
    sum = 500_000.to_f
    annual_payment = (sum / 30).round
    paid_total = 0
    credit_sum_total = 0
    30.times do |i|
      left_to_pay = (sum - ((i + 1) * annual_payment))
      credit_sum = (left_to_pay * 0.04)
      credit_sum_total += credit_sum
      break if left_to_pay.negative?

      paid_total += annual_payment
      puts format(
             "В %d году осталось выплатить $ %8s, выплачено $ %8s, по кредиту 4%% на ост. сумму $ %8s",
             year + i,
             Format.group_digits(left_to_pay.to_i),
             Format.group_digits(paid_total),
             Format.group_digits(credit_sum.to_i)
           )
    end
    puts "=" * 80
    puts format(
           "Итого, выплаты за 30 лет по кредиту 4%% составляют %8s",
           Format.group_digits(credit_sum_total.to_i)
         )
  end
end

# A module that help to use method gets no matter what the file argument is
module InputHelper
  # Handle input method based on its file argument
  def gets
    ARGV.nil? ? Kernel.gets : $stdin.gets
  end
end

# Задание 2: напишите программу для подсчета годовой зарплаты. Пользователь вводит
# размер заработной платы в месяц, а программа выводит размер заработной платы в год.
# Допустим, что пользователь каждый месяц хочет откладывать 15% своей зарплаты.
# Измените программу, чтобы она выводила не только размер заработной платы, но и
# размер отложенных за год средств. Измените программу, чтобы она выводила размер
# отложенных средств за 5 лет.
#
module StringInterpolation
  include InputHelper
  def self.salary
    puts "Введите размер заработной платы в месяц"
    if ARGV[0].nil? == false
      salary = ARGV[0].to_i
      puts salary
    else
      salary = gets.to_i
    end
    # binding.pry
    puts format(
           "Размер заработной платы в год $ %s",
           Format.group_digits(salary * 12)
         )
    puts format(
           "Сумма накопленных средств за 5 лет из расчета 15%% от заработной платы $ %s",
           Format.group_digits((salary * 12 * 5 * 0.15).to_i)
         )
  end
end

# Test input command line arguments
class TestARGV
  def initialize
    # inspect ARGV
    ARGV.each { |arg| puts arg }
    # puts "=" * 80
    # puts $*
  end
end

# Задание: напишите программу, которая спрашивает логин и пароль пользователя в
# консоли. Если имя “admin” и пароль “12345”, программа должна выводить на экран
# “Доступ к банковской ячейке разрешен”.
#
# Задание: известно, что на Луне продают участки. Любой участок менее 50 квадратных
# метров стоит 1000 долларов. Участок площадью от 50 до 100 квадратных метров стоит
# 1500 долларов. От 100 и выше - по 25 долларов за квадратный метр. Напишите
# программу, которая запрашивает длину и ширину участка и выводит на экран его
# стоимость.
#
# Задание: напишите программу “иммигрант”. Программа должна задавать следующие
# вопросы: “У вас есть высшее образование? (y/n)”, “У вас есть опыт работы
# программистом? (y/n)”, “У вас более трех лет опыта? (y/n)”. За каждый положительный
# ответ начисляется 1 балл (переменную можно назвать score). Если набралось 2 или
# более баллов программа должна выводить на экран “Добро пожаловать в США”.
#
module CombinationOfConditions
  def self.access
    puts "Введите логин:"
    login = gets.chomp
    puts "Введите пароль:"
    password = gets.chomp
    return unless login == "admin" && password == "12345"

    puts "Доступ к банковской ячейке разрешен"
  end

  def self.cost_of_land
    puts "Введите длину участка (м)"
    length = gets.to_i
    puts "Введите ширину участка (м)"
    width = gets.to_i
    square = length * width
    if square < 50
      puts "Стоимость участка $ 1000"
    elsif square <= 100
      puts "Стоимость участка $ 1500"
    else
      puts "Стоимость участка $ #{square * 25}"
    end
  end

  def self.immigrant
    points = 0
    puts "У вас есть высшее образование? (y/n)"
    points += 1 if gets.chomp! == "y"
    puts "У вас есть опыт работы программистом? (y/n)"
    points += 1 if gets.chomp! == "y"
    puts "У вас более трех лет опыта? (y/n)"
    points += 1 if gets.chomp! == "y"
    puts "Добро пожаловать в США" if points >= 2
  end
end

# Задание: напишите программу, которая будет выводить случайное число от 500 до 510.
# Задание: напишите программу, которая будет выводить случайное число с дробью от 0 до
# 1. Например, 0.54321 или 0.123456
# Задание: напишите программу, которая будет выводить случайное число с дробью от 2 до
# 4.
#
module RandomNumbers
  def self.random500510
    puts "случайное число от 500 до 510."
    5.times { |_n| puts rand(500..510) }
  end

  def self.random01
    puts "случайное число от 0 до 1."
    5.times { |_n| puts rand(0.0..1.0) }
  end

  def self.random24
    puts "случайное число от 2 до 4."
    5.times { |_n| puts rand(2.0..4.0) }
  end
end

# Написать программу “угадай число”. Компьютер загадывает число, а пользователю нужно
# это число угадать.
# Программа загадывает число от 1 до 1_000_000 (1
# миллиона). Чтобы можно было угадать это число, программа должна сравнивать текущий
# ответ пользователя и искомое число: 1) если ответ пользователя больше, то программа
# должна выводить на экран “Искомое число меньше вашего ответа”; 2) иначе “Искомое
# число больше вашего ответа”
#
module GuessTheNumber
  def self.guess11000000
    number = rand(1..1_000_000)
    print "Привет! Я загадал число от 1 до 1_000_000, попробуйте угадать: "
    loop do
      input = gets.to_i
      if number > input
        print "Загаданное число больше, попробуйте ещё раз: "
      elsif number < input
        print "Загаданное число меньше, попробуйте ещё раз: "
      else
        puts "Правильно! Вы угадали"
        exit
      end
    end
  end
end

# Виды прогрессбаров
module Progressbar
  def self.type1
    puts "Progressbar type 1"
    print "Formatting hard drive"
    100.times do
      print "."
      sleep rand(0.05..0.5)
    end
    puts
  end

  def self.type2
    puts "Progressbar type 2"
    symbol_array = ["\\", "\|", "/", "-"]
    50.times do |n|
      # print "#{symbol_array[rand(0..3)]}\r"
      print "#{symbol_array[n % 4]}\r"
      sleep rand(0.05..0.5)
      # sleep 0.5
    end
    puts
  end
end

# Задание: напишите метод, который выводит на экран пароль, но в виде звездочек.
# Например, если пароль “secret”, метод должен вывести “Ваш пароль: ******”.
#
module InputPassword
  def self.password_mask
    print "Введите пароль: "
    password = gets.chomp
    puts "Ваш пароль: #{'*' * password.length}"
  end
end

# arr = [
#         %w[a b c],
#         %w[d e f],
#         %w[g h i]
#       ]
# Задание: обойдите массив выше “вручную”, без помощи циклов, крест-накрест, таким
# образом, чтобы вывести на экран строку “aeiceg” (подпрограмма займет 6 строк - по 1
# строке для каждого элемента).
#
module MyArray
  def self.go_cross
    arr = [%w[a b c], %w[d e f], %w[g h i]]
    print arr[0][0], arr[1][1], arr[2][2], arr[0][2], arr[1][1], arr[2][0], "\n"
  end
end

# Задание: создайте 2D массив размером 3 на 3. Каждый элемент будет иметь одинаковое
# значение (например, “something”). Сделайте так, чтобы каждый элемент массива был
# защищен от “upcase!”. Например, если мы вызовем `arr[2][2].upcase!`, этот вызов не
# изменит содержимое других ячеек массива.
#
module MyArray3
  def self.array_something
    arr = Array.new(3) { Array.new(3) { "something" } }
    print "#{arr}\n"
    arr[2][2] = arr[2][2].upcase
    print "#{arr}\n"
  end
end

# Задание: к вам обратился предприниматель Джон Смит. Джон говорит, что его бизнес
# специализируется на создании телефонных номеров для рекламы. Они хотят подписать с
# вами контракт, но прежде хотелось бы убедиться, что вы хороший программист, можете
# работать с их требованиями, и доставлять качественное программное обеспечение.
# Они говорят: у нас есть номера телефонов с буквами. Например, для бизнеса по продаже
# матрасов существует номер “555-MATRESS”, который транслируется в “555-628-7377”.
# Когда наши клиенты набирают буквенный номер на клавиатуре телефона (см.картинку
# ниже), он транслируется в цифровой. Напишите программу, которая будет переводить
# (транслировать) слово без дефисов в телефонный номер.
#
module LettersToPhoneTranslator
  def self.phone_to_number(phone)
    result = ""
    arr_phone_numbers = %w(
      [0-9]
      [ABC]
      [DEF]
      [GHI]
      [JKL]
      [MNO]
      [PQRS]
      [TUV]
      [WXYZ]
    )
    phone.upcase.each_char do |char|
      arr_phone_numbers.each_index do |index|
        next unless char =~ /#{arr_phone_numbers[index]}/

        result += (index.zero? ? char : (index + 1).to_s)
        break
      end
    end
    puts result
  end
end

# Задание: напишите игру “камень, ножницы, бумага” (`[:rock, :scissors, :paper]`).
# Пользователь делает свой выбор и играет с компьютером.
#
module RockPaperScissors
  def self.start_game
    # arr_units = %i[rock scissors paper]
    arr_emoji = %i[🤛 ✌️ 🤚]
    user_choice = nil
    computer_choice = nil
    user_points = 0
    computer_points = 0
    loop do
      system "clear"
      print "User: #{user_points} PC: #{computer_points}\n"
      print "(R)ock, (S)cissors, (P)aper?: "
      s = gets.strip.capitalize
      case s
      when "R"
        user_choice = arr_emoji[0]
      when "S"
        user_choice = arr_emoji[1]
      when "P"
        user_choice = arr_emoji[2]
      else
        puts "Игра завершена"
        break
      end
      puts "Ваш выбор #{user_choice}"
      computer_choice = arr_emoji.sample
      puts "Выбор компьютера #{computer_choice}"
      diff = arr_emoji.index(user_choice) - arr_emoji.index(computer_choice)
      if [-1, 2].include?(diff)
        user_points += 1
        puts "Победа пользователя"
      elsif [1, -2].include?(diff)
        computer_points += 1
        puts "Победа компьютера"
      else
        puts "Ничья"
      end
      print "Нажмите любую клавишу для следующего раунда или x для выхода: "
      s = gets.strip.capitalize
      if s == "X"
        puts "Игра завершена"
        break
      end
    end
  end
end

# Задание: используя инициализированный хеш вида:
# ```
# obj = {
# soccer_ball: 410,
# tennis_ball: 58,
# golf_ball: 45
# }
# ```
# Напишите код, который адаптирует этот хеш для условий на Луне. Известно, что вес на
# луне в 6 раз меньше, чем вес на Земле.
#
module ShoppingCartOnTheMoon
  module_function

  def default_shopping_cart
    { soccer_ball: 410, tennis_ball: 58, golf_ball: 45 }
  end

  def weight_on_the_moon(shopping_cart = default_shopping_cart)
    puts shopping_cart.inspect
    shopping_cart.each_key { |key| shopping_cart[key] /= 6 }
    puts shopping_cart.inspect
  end
  # module_function :default_shopping_cart
end

# Задание: “лунный магазин”. Используя хеш с новым весом из предыдущего задания
# напишите программу, которая для каждого типа спрашивает пользователя какое
# количество мячей пользователь хотел бы купить в магазине (ввод числа из консоли). В
# конце программа выдает общий вес всех товаров в корзине. Для сравнения программа
# должна также выдавать общий вес всех товаров, если бы они находились на Земле.
#
module ShoppingCart
  module_function

  # include ShoppingCartOnTheMoon
  def input_shopping_cart
    default_cart = ShoppingCartOnTheMoon.default_shopping_cart
    puts "Корзина по умолчанию, по 1 шт каждого вида: #{default_cart.inspect}"
    puts "Вес корзины по умолчанию: #{default_cart.values.inject(0, :+)}"
    cart = {}
    default_cart.each do |key, value|
      print "Введите количество мячей вида #{key}: "
      cart[key] = gets.to_i * value
    end
    puts "Вес корзины на Земле: #{cart.values.inject(0, :+)}"
    puts "Вес корзины на Луне: #{cart.values.inject(0) { |sum, n| sum + n / 6 }}"
  end
end

# Задание: корзина пользователя в Интернет-магазине определена следующим массивом
# (qty - количество единиц товара, которое пользователь хочет купить, type - тип):
# ```
# cart = [
# { type: :soccer_ball, qty: 2 },
# { type: :tennis_ball, qty: 3 }
# ]
# ```
# А наличие на складе следующим хешем:
# ```
# inventory = {
# soccer_ball: { available: 2, price_per_item: 100 },
# tennis_ball: { available: 1, price_per_item: 30 },
# golf_ball: { available: 5, price_per_item: 5 }
# }
# Написать программу, которая выводит на экран цену всех товаров в корзине (total), а
# также сообщает - возможно ли удовлетворить запрос пользователя - набрать все единицы
# товара, которые есть на складе.
#
module CartCost
  module_function

  def user_cart
    [{ type: :soccer_ball, qty: 2 }, { type: :tennis_ball, qty: 3 }]
  end

  def inventory
    {
      soccer_ball: {
        available: 2,
        price_per_item: 100
      },
      tennis_ball: {
        available: 4,
        price_per_item: 30
      },
      golf_ball: {
        available: 5,
        price_per_item: 5
      }
    }
  end

  def cart_available?
    user_cart.inject(true) do |available, hash|
      user_cart_available(available, hash)
    end
  end

  def cart_cost
    user_cart.inject(0) { |sum, hash| user_cart_sum(sum, hash) }
  end

  def user_cart_sum(sum, hash)
    sum + inventory[hash[:type]][:price_per_item] * hash[:qty]
  end

  def user_cart_available(available, hash)
    available && inventory[hash[:type]][:available] >= hash[:qty]
  end

  def display_payment
    puts "Товар в корзине #{user_cart}"
    if cart_available?
      puts "Товар есть в наличии на складе"
      puts "Стоимость товара #{cart_cost}$"
    else
      puts "Товара нет в наличии на складе"
    end
  end
end

# Задание: напишите хеш, который бы отображал состояние следующего приложения:
# см. рис. на стр. 152
#
# Задание: напишите программу, которая будет принимать хеш, который вы определили в
# предыдущей задаче, и выводить результат на экран. Убедитесь, что переключатель
# работает и программа не выводит приход, если переключатель включен.
#
module BankOnline
  module_function

  def state_view
    {
      client: "Герман Оскарович Блокчейн",
      balance: 123.45,
      display_receipt: true,
      transactions: [
        { description: "Сапоги", type: :consumption, sum: 40 },
        { description: "Зарплата (компания БЛИЖП)", type: :coming, sum: 1000 },
        { description: "Продажа ваучера", type: :coming, sum: 300 },
        { description: "Велосипед", type: :consumption, sum: 200 },
        { description: "Протез для ноги бабушке", type: :consumption, sum: 300 }
      ]
    }
  end

  def print_state_view
    state = state_view
    state[:transactions].filter! do |item|
      state[:display_receipt] ? item[:type] == :consumption : true
    end
    # puts JSON.pretty_generate state
    ap state
  end
end

# Задание: напишите “сложный” англо-русский словарь, где каждому английскому слову
# может соответствовать несколько переводов (например: cat это “кот”, “кошка”).
#
module Dictionary
  module_function

  def dictionary_data
    { cat: %w[кот кошка], girl: %w[девочка девушка], dog: %w[собака пес] }
  end

  def transactions
    dict = dictionary_data
    print "Введите слово: "
    input = gets.chomp.to_sym
    # input = 'girl'
    puts "Перевод: #{dict[input].join(', ')}"
  end
end

# Задание: задайте базу данных (хеш) своих контактов. Для каждого контакта (фамилия)
# может быть задано три параметра: email, cell_phone (номер моб.телефона), work_phone
# (номер рабочего телефона). Напишите программу, которая будет спрашивать фамилию и
# выводить на экран контактную информацию.
#
module ContactsDataBase
  module_function

  def contacts_data
    {
      "Иванов": {
        email: "ivanov777@gmail.com",
        cell_phone: "22222",
        work_phone: "333333"
      },
      "Петров": {
        email: "petrov555@gmail.com",
        cell_phone: "444444",
        work_phone: "555555"
      },
      "Сидоров": {
        email: "sidorov333@gmail.com",
        cell_phone: "6666666",
        work_phone: "7777777"
      }
    }
  end

  def contact_data
    data = contacts_data
    print "Введите фамилию: "
    input = gets.chomp
    puts "ФИО: #{input}"
    puts "email: #{data[input.to_sym][:email]}"
    puts "номер мобильного телефона: #{data[input.to_sym][:cell_phone]}"
    puts "номер рабочего телефона: #{data[input.to_sym][:work_phone]}"
  end
end

# Задание: напишите программу, которая считает частотность букв и выводит на экран
# список букв и их количество в предложении.
#
module FrequencyOfLetters
  module_function

  def frequence
    puts "Введите текст"
    input = gets.chomp
    freq_hash =
      input
      .split("")
      .each_with_object(Hash.new(0)) do |item, hash|
        hash[item.to_sym] += 1 if item =~ /[a-zA-Z]/
      end
    puts "Список букв в предложении"
    ap freq_hash
  end
end

# Задание: Центр Управления Полетами поручил вам задание написать метод "launch" (от
# англ. “запуск”), который будет принимать набор опций в виде хеша и отправлять в космос
# астронавтов “Белку” и/или “Стрелку”. Метод должен принимать следующие параметры:
# ● `angle` - угол запуска ракеты. Если не задан, то значение по-умолчанию равно 90
# (градусов)
# ● `astronauts` - массив символов (:belka, :strelka), если не задан, то в космос нужно
# отправлять и Белку, и Стрелку.
# ● `delay` - количество секунд через которые запустить ракету, если не задано, то
# равно пяти
# Метод должен вести подсчет оставшихся до запуска секунд (например: “Осталось секунд:
# 5 4 3 2 1”). После истечения задержки, метод должен выводить сообщение о том, какой
# астронавт (астронавты) запущены, а также под каким углом была запущена ракета. Метод
# может принимать любое количество параметров (ноль, один, два, три). Возможные
# варианты вызова метода:
# ● `launch`
# ● `launch(angle: 91)`
# ● `launch(delay: 3)`
# ● `launch(delay: 3, angle: 91)`
# ● `launch(astronauts: [:belka])`
# ● и т.д.
#
module SpaceControlCenter
  module_function

  def launch(options = {})
    angle = options[:angle] || 90
    astronauts = options[:astronauts] || %i[belka strelka]
    delay = options[:delay] || 5
    print "Осталось секунд:  "
    sleep 1
    delay.downto(1) do |i|
      print "\b#{i}"
      sleep 1
    end
    print "\b0\n"
    puts "Запущены астронавты: #{astronauts.join(', ')}"
    puts "Ракета запущена под углом: #{angle}"
  end
end

# Задание: имеются следующие данные:
# data = {
# soccer_ball: { name: 'Футбольный мяч', weight: 410, qty: 5 },
# tennis_ball: { name: 'Мяч для тенниса', weight: 58, qty: 10 },
# golf_ball: { name: 'Мяч для гольфа', weight: 45, qty: 15 }
# }
# Написать программу, которая будет выводить на экран:
# На складе есть:
# Футбольный мяч, вес 410 грамм, количество: 5 шт.
# Мяч для тенниса, вес 58 грамм, количество: 10 шт.
# Мяч для гольфа, вес 45 грамм, количество: 15 шт.
#
module Warehouse
  module_function

  def initial_balance_of_goods
    {
      soccer_ball: {
        name: "Футбольный мяч",
        weight: 410,
        qty: 5
      },
      tennis_ball: {
        name: "Мяч для тенниса",
        weight: 58,
        qty: 10
      },
      golf_ball: {
        name: "Мяч для гольфа",
        weight: 45,
        qty: 15
      }
    }
  end

  def availability_of_goods
    goods = initial_balance_of_goods
    puts "На складе есть:"
    puts "Футбольный мяч, вес #{goods[:soccer_ball][:weight]} грамм, количество: #{goods[:soccer_ball][:qty]} шт."
    puts "Мяч для тенниса, вес #{goods[:tennis_ball][:weight]} грамм, количество: #{goods[:tennis_ball][:qty]} шт."
    puts "Мяч для гольфа, вес #{goods[:golf_ball][:weight]} грамм, количество: #{goods[:golf_ball][:qty]} шт."
  end
end

# Задание: напишите класс Monkey (“обезьянка”). В классе должно быть 1) реализовано
# два метода: run, stop; 2) каждый из методов должен менять состояние объекта; 3) you
# must expose the state of an object так, чтобы можно было узнать о состоянии класса
# снаружи, но нельзя было его модифицировать (к сожалению, точно перевести на русский
# язык выражение “expose the state” не получилось. Посмотрите перевод слова “expose” в
# словаре). Создайте экземпляр класса Monkey, вызовите методы объекта и проверьте
# работоспособность программы.

# Задание: сделайте так, чтобы при инициализации класса Monkey экземпляру
# присваивалось случайное состояние. Создайте массив из десяти обезьянок. Выведите
# состояние всех элементов массива на экран.
#
class Monkey
  attr_reader :state

  def initialize
    # @state = :stop
    @state = %i[stop run].sample
  end

  def run
    self.state = :run
  end

  def stop
    self.state = :stop
  end
end

# BlocksNParameters.annual_payment
# StringInterpolation.salary
# TestARGV.new
# CombinationOfConditions.access
# CombinationOfConditions.cost_of_land
# CombinationOfConditions.immigrant
# RandomNumbers.random500510
# RandomNumbers.random01
# RandomNumbers.random24
# GuessTheNumber.guess11000000
# Progressbar.type1
# Progressbar.type2
# InputPassword.password_mask
# MyArray.go_cross
# MyArray3.array_something
# LettersToPhoneTranslator.phone_to_number("555MATRESS")
# RockPaperScissors.start_game
# ShoppingCartOnTheMoon.weight_on_the_moon
# ShoppingCart.input_shopping_cart
# CartCost.display_payment
# BankOnline.print_state_view
# Dictionary.transactions
# ContactsDataBase.contact_data
# FrequencyOfLetters.frequence
# SpaceControlCenter.launch
# SpaceControlCenter.launch(angle: 91)
# SpaceControlCenter.launch(delay: 3)
# SpaceControlCenter.launch(delay: 3, angle: 91)
# SpaceControlCenter.launch(astronauts: [:belka])
# Warehouse.availability_of_goods
# m = Monkey.new
# puts m.state
# m.run
# puts m.state
arr = Array.new(10) { Monkey.new }
arr.each { |item| puts item.state }
