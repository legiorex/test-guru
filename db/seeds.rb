# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Category.create([{ title: 'Ruby' }, { title: 'JavaScript' }])
# Test.create([
#               { title: 'types in Ruby', category_id: 1 },
#               { title: 'types in JavaScript', category_id: 2 }
#               { title: 'Классы в Ruby', level: 1, category_id: 1 },
#               { title: 'Блоки', level: 2, category_id: 1 },
#               { title: 'Массивы в Ruby', level: 0, category_id: 1 },
#               { title: 'Стрелочные функции', level: 1, category_id: 2 },
#               { title: 'Функции генераторы', level: 3, category_id: 2 },
#               { title: 'Асинхронные операции', level: 3, category_id: 2 }
#             ])
# Question.create([
#                   { body: 'Приведите пример типа number и string', test_id: 1 },
#                   { body: 'Что такое Хеш в Ruby?', test_id: 1 },
#                   { body: 'Что такое undefined в JavaScript?', test_id: 2 },
#                   { body: 'Что такое Массив в JavaScript?', test_id: 2 }
#                 ])
# Answer.create([
#                 { body: "Тип number - это число, например 0, 1, 500. Тип string это строка, например 'Hello' или '5'",
#                   correct: true, question_id: 1 },
#                 {
#                   body: 'Хеш - коллекция пар ключ-значение. Хеш подобен классу Array, за исключением того, что индексация осуществляется через ключи (объекты любого типа), а не через целочисленные индексы.', correct: true, question_id: 1
#                 },
#                 {
#                   body: 'Переменная, не имеющая присвоенного значения, обладает типом undefined. Также undefined возвращают метод или инструкция, если переменная, участвующая в вычислениях, не имеет присвоенного значения. Функция возвращает undefined, если она не возвращает какого-либо значения.', correct: true, question_id: 2
#                 },
#                 {
#                   body: 'Массив (Array) в JavaScript является глобальным объектом, который используется для создания массивов; которые представляют собой высокоуровневые спископодобные объекты.', correct: true, question_id: 2
#                 }
#               ])
# User.create([
#               { first_name: 'Василий', last_name: 'Петров', email: 'petrov@mail.com' },
#               { first_name: 'Юрий', last_name: 'Сидоров', email: 'sidorov@mail.com' }
#             ])
# TestUser.create([
#                  { test_id: 1, user_id: 1 },
#                  { test_id: 2, user_id: 1 },
#                  { test_id: 2, user_id: 2 },
#                  { test_id: 8, user_id: 1 },
#                  { test_id: 7, user_id: 1 },
#                  { test_id: 4, user_id: 1 }

#                 ])
