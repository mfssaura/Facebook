# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Chris Norwood",
             email: "cnorwood94@gmail.com",
             password: "mindfire",
             password_confirmation: "mindfire")
User.create!(name: "Dan Norwood",
             email: "dan@spectreair.com",
             password: "mindfire",
             password_confirmation: "mindfire")

#Dummy User creation
25.times do |n|
  name = Faker::Name.name 
  email = "example-#{n}@odinbook.com"
  password = "mindfire"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end 

#Posts
me = User.first
10.times do |n|
  body = Faker::Lorem.sentence(6)
  me.posts.create!(body: body)
end 

dan = User.second
10.times do |n|
  body = Faker::Lorem.sentence(2)
  dan.posts.create!(body: body)
end 

5.times do |n|
  body = Faker::Lorem.sentence(2)
  me.posts.first.comments.create!(body: body)
end 

5.times do |n|
  body = Faker::Lorem.sentence(2)
  dan.posts.first.comments.create!(body: body)
end 