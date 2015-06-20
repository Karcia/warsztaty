# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

5.times do
  User.create(email: Faker::Internet.email, password: "haslo1234", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
end

User.create(email: "admin@example.com", password: "admin1234", firstname: "John", lastname: "Doe", is_admin: true)

3.times do
  Category.create(name: Faker::Color.name)
end

30.times do
  p = Product.create(title: Faker::Food.fruit, description: Faker::Lorem.sentence, price: rand(1..100), category_id: Category.order("RANDOM()").first.id, user_id: User.order("RANDOM()").first.id)
  3.times do
    Review.create(product: p, user: User.order("RANDOM()").first, content: Faker::Lorem.sentence, rating: rand(1..5))
  end
end