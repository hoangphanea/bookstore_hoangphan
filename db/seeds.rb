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