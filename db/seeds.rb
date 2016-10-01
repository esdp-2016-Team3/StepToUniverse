# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Position.create(title: "Студент", id: 1)
Position.create(title: "Преподаватель", id: 2)

User.create(name: "stud1", email: 'stud1@gmail.com', status: 'active', position_id: 1, skype: "stud.1", phone: +9379991, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:44:12')
User.create(name: "stud2", email: 'stud2@gmail.com', status: 'active', position_id: 1, skype: "stud.2", phone: +9379992, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:46:12')

User.create(name: "teach1", email: 'teach1@gmail.com', status: 'active', position_id: 2, skype: "stud.1", phone: +9379981, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:47:12')
User.create(name: "teach2", email: 'teach2@gmail.com', status: 'active', position_id: 2, skype: "stud.2", phone: +9379981, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:48:12')

User.create(name: "pend1", email: 'pend1@gmail.com', status: 'notactive', position_id: 1, skype: "pend.1", phone: +9379971, password: 'asdasd', password_confirmation: 'asdasd', confirmed_at: '2016-09-28 13:49:12')

Content.create(title: "Главная анонимная", description: "контентная информация")

Level.create(name: "Beginner")
Level.create(name: "Intermediate")
Level.create(name: "Advanced")
Level.create(name: "Proficiency")

count = 0
7.times do

  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 1, is_active: true)
	  Answer.create(content: 'true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
  
  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 2, is_active: true)
	  Answer.create(content: 'true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  
  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 3, is_active: true)
	  Answer.create(content: 'true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)

  count += 1
  Question.create(content: Faker::Lorem.sentence, level_id: 4, is_active: true)
	  Answer.create(content: 'true', is_correct: true, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
	  Answer.create(content: Faker::Lorem.sentence, is_correct: false, question_id: count)
end