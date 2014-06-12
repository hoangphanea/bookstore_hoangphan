# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password  = "password"
  phone = Faker::PhoneNumber.phone_number
  user = User.create(full_name: name,
               email: email,
               password: password,
               phone: phone,
               birthday: "22/01/1992")
  user.confirm!
end

20.times do |n|
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  author_name = Faker::Name.name
  publisher_name = Faker::Commerce.color
  unit_price = rand(10) / 3
  photo = "cover#{ n % 5 }.jpg"
  published_date = rand(2.months).ago
  Book.create(title: title,
                description: description,
                author_name: author_name,
                publisher_name: publisher_name,
                unit_price: unit_price,
                published_date: published_date,
                photo: photo)
end

10.times do |n|
  name = "#{Faker::Commerce.department} #{ n }"
  sort_order = n
  category = Category.create(name: name,
                  sort_order: sort_order)
  category.book_category_items.create!(book_id: n)
  category.book_category_items.create!(book_id: 9 + n)
  category.book_category_items.create!(book_id: 8 + n)
end

