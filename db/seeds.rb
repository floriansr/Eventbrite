# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attendance.destroy_all
User.destroy_all
Event.destroy_all

10.times do
	User.create(email: Faker::Internet.free_email, first_name: Faker::TvShows::GameOfThrones.house, last_name: Faker::TvShows::GameOfThrones.character, description: Faker::TvShows::GameOfThrones.quote, encrypted_password: Faker::TvShows::GameOfThrones.dragon)
end

10.times do
	Event.create(start_date: Faker::Date.forward, duration: 30, title: Faker::Book.title, description: Faker::Hacker.say_something_smart, price: Faker::Number.between(1, 1000), location: Faker::TvShows::GameOfThrones.city, admin_id: rand(User.all.first.id..User.all.last.id))
end

10.times do
	Attendance.create(stripe_customer_id: Faker::Number.number(10), user_id: rand(User.all.first.id..User.all.last.id), event_id: rand(Event.all.first.id..Event.all.last.id))
end
