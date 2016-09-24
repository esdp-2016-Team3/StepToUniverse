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
User.create(name: "Test", email: 'test@gmail.com', status: 'notactive', position_id: 1, skype: "test.123", phone: +9379992, password: '123456', password_confirmation: '123456')
User.create(name: "Test2", email: 'test2@gmail.com', status: 'notactive', position_id: 2, skype: "test.123", phone: +9379992, password: '123456', password_confirmation: '123456')
