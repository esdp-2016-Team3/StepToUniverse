# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the R3ngs' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Position.create(title: "Студент", id: 1)
Position.create(title: "Преподаватель", id: 2)

User.create(name: "stud1", email: 'stud1@gmail.com', status: 'active', position_id: 1, teacher_id: 3, skype: "stud.1", phone: +9379991, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:44:12')
User.create(name: "stud2", email: 'stud2@gmail.com', status: 'active', position_id: 1, teacher_id: 3, skype: "stud.2", phone: +9379992, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:46:12')

User.create(name: "teach1", email: 'teach1@gmail.com', status: 'active', position_id: 2, skype: "stud.1", phone: +9379981, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:47:12')
User.create(name: "teach2", email: 'teach2@gmail.com', status: 'active', position_id: 2, skype: "stud.2", phone: +9379981, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:48:12')

User.create(name: "pend1", email: 'pend1@gmail.com', status: 'notactive', position_id: 1, skype: "pend.1", phone: +9379971, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:49:12')

Content.create(title: "Главная анонимная", description: "контентная информация")

Level.create(name: "Beginner")
Level.create(name: "Intermediate")
Level.create(name: "Advanced")
Level.create(name: "Proficiency")

LibraryFile.create(name: 'Book1', description: Faker::Lorem.sentence, user_id: 3, pather: 'book1.pdf', file: File.new('public/library_files/book1.pdf'))
LibraryFile.create(name: 'Book2', description: Faker::Lorem.sentence, user_id: 3, pather: 'book2.pdf', file: File.new('public/library_files/book2.pdf'))

TextFile.create(name: 'Hw1', description: Faker::Lorem.sentence, homework_id: 1, pather: 'hw1.pdf', file: File.new('public/text_files/hw1.pdf'))
TextFile.create(name: 'Hw2', description: Faker::Lorem.sentence, homework_id: 2, pather: 'hw2.pdf', file: File.new('public/text_files/hw2.pdf'))
TextFile.create(name: 'Hw3', description: Faker::Lorem.sentence, homework_id: 2, pather: 'hw2.pdf', file: File.new('public/text_files/hw2.pdf'))
TextFile.create(name: 'Hw4', description: Faker::Lorem.sentence, homework_id: 2, pather: 'hw2.pdf', file: File.new('public/text_files/hw2.pdf'))

Homework.create(title: 'Homework1', user_id: 3)
Homework.create(title: 'Homework2', user_id: 3)
Homework.create(title: 'Homework3', user_id: 3)
Homework.create(title: 'Homework4', user_id: 3)

HomeworkAssignment.create(user_id: 1, homework_id: 1)
HomeworkAssignment.create(user_id: 1, homework_id: 2)

HomeworkResult.create(homework_assignment_id: 1, is_checked: false)
HomeworkResult.create(homework_assignment_id: 2, is_checked: true)

count = 0
7.times do

  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 1, is_active: true)
	  Answer.create(content: Faker::Lorem.sentence + '|true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
  
  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 2, is_active: true)
	  Answer.create(content: Faker::Lorem.sentence + '|true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  
  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 3, is_active: true)
	  Answer.create(content: Faker::Lorem.sentence + '|true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)

  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 4, is_active: true)
	  Answer.create(content: Faker::Lorem.sentence + '|true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence + '|false', is_correct: false, question_id: count)
end