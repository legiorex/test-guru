# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Ruby' }, { title: 'JavaScript' }])
users = User.create([
                      { first_name: 'Василий', last_name: 'Петров', email: 'petrov@mail.com' },
                      { first_name: 'Юрий', last_name: 'Сидоров', email: 'sidorov@mail.com' }
                    ])

tests = Test.create([
                      { title: 'types in Ruby', category_id: categories[0].id, author_id: users[0].id },
                      { title: 'types in JavaScript', category_id: categories[1].id, author_id: users[1].id },
                      { title: 'Классы в Ruby', level: 1, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Блоки', level: 2, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Массивы в Ruby', level: 0, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Стрелочные функции', level: 1, category_id: categories[1].id, author_id: users[1].id },
                      { title: 'Функции генераторы', level: 3, category_id: categories[1].id, author_id: users[1].id },
                      { title: 'Асинхронные операции', level: 3, category_id: categories[1].id, author_id: users[1].id }
                    ])

questions = Question.create([
                              { body: 'Приведите пример типа number и string', test_id: tests[0].id },
                              { body: 'Что такое Хеш в Ruby?', test_id: tests[0].id },
                              { body: 'Что такое undefined в JavaScript?', test_id: tests[1].id },
                              { body: 'Что такое Массив в JavaScript?', test_id: tests[1].id }
                            ])
Answer.create([
                { body: "Тип number - это число, например 0, 1, 500. Тип string это строка, например 'Hello' или '5'",
                  correct: true, question_id: questions[0].id },
                {
                  body: 'Хеш - коллекция пар ключ-значение. Хеш подобен классу Array, за исключением того, что индексация осуществляется через ключи (объекты любого типа), а не через целочисленные индексы.', correct: true, question_id: questions[0].id
                },
                {
                  body: 'Переменная, не имеющая присвоенного значения, обладает типом undefined. Также undefined возвращают метод или инструкция, если переменная, участвующая в вычислениях, не имеет присвоенного значения. Функция возвращает undefined, если она не возвращает какого-либо значения.', correct: true, question_id: questions[1].id
                },
                {
                  body: 'Массив (Array) в JavaScript является глобальным объектом, который используется для создания массивов; которые представляют собой высокоуровневые спископодобные объекты.', correct: true, question_id: questions[1].id
                }
              ])

TestsUser.create([
                   { test_id: tests[0].id, user_id: users[0].id },
                   { test_id: tests[1].id, user_id: users[0].id },
                   { test_id: tests[7].id, user_id: users[0].id },
                   { test_id: tests[6].id, user_id: users[0].id },
                   { test_id: tests[3].id, user_id: users[0].id },
                   { test_id: tests[1].id, user_id: users[1].id }

                 ])
