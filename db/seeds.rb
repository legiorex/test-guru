# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [{ title: 'Ruby' }, { title: 'JavaScript' }]
get_categories = categories.map { |item| Category.find_or_create_by(item) }

users = [
  { first_name: 'Василий', last_name: 'Петров', email: 'petrov@mail.com', password: '123456',
    password_confirmation: '123456' },
  { first_name: 'Юрий', last_name: 'Сидоров', email: 'sidorov@mail.com', password: '123456',
    password_confirmation: '123456' },
  { first_name: 'Иван', last_name: 'Умнейший', email: 'smart@mail.com', password: '123456',
    password_confirmation: '123456' }
]

puts users

get_users = users.map do |item|
  user = User.new(item)
  user.skip_confirmation!
  user.save!
  user
end

puts "users #{get_users}"

tests = [
  { title: 'types in Ruby', category_id: get_categories[0].id, author_id: get_users[0].id },
  { title: 'types in JavaScript', category_id: get_categories[1].id, author_id: get_users[1].id }
]
puts tests

get_tests = tests.map { |item| Test.find_or_create_by(item) }
puts get_tests
questions = [
  { body: 'Приведите пример типа number и string', test_id: get_tests[0].id },
  { body: 'Что такое Хеш в Ruby?', test_id: get_tests[0].id },
  { body: 'Что такое undefined в JavaScript?', test_id: get_tests[1].id },
  { body: 'Что такое Массив в JavaScript?', test_id: get_tests[1].id }
]
puts questions
get_questions = questions.map { |item| Question.find_or_create_by(item) }

puts get_questions[0].id

answers = [
  { body: "'Hello', 5",
    correct: true, question_id: get_questions[0].id },
  { body: "['a' 'b', 'c']", question_id: get_questions[0].id },
  { body: "{a: 'Hello'}", question_id: get_questions[0].id },
  { body: ':hello', question_id: get_questions[0].id },
  {
    body: 'Хеш - коллекция пар ключ-значение. Хеш подобен классу Array, за исключением того, что индексация осуществляется через ключи (объекты любого типа), а не через целочисленные индексы.', correct: true, question_id: get_questions[1].id
  },
  {
    body: 'Переменная, не имеющая присвоенного значения, обладает типом undefined. Также undefined возвращают метод или инструкция, если переменная, участвующая в вычислениях, не имеет присвоенного значения. Функция возвращает undefined, если она не возвращает какого-либо значения.', correct: true, question_id: get_questions[1].id
  },
  {
    body: 'множество значений элементов соединенных вместе, упорядоченные, где каждый элемент может быть разного типа данных: строка, символы, интервалы, числа.', question_id: get_questions[1].id
  },
  {
    body: 'Массив (Array) в JavaScript является глобальным объектом, который используется для создания массивов; которые представляют собой высокоуровневые спископодобные объекты.', correct: true, question_id: get_questions[3].id
  },
  {
    body: 'тип данных представляет как целочисленные значения, так и числа с плавающей точкой.', question_id: get_questions[3].id
  }
]

answers.each { |item| Answer.find_or_create_by(item) }
