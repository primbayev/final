# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(
  name: 'admin',
  email: 'admin@exampl.com',
  admin: true,
  active: true,
  password: 'qweasd',
  password_confirmation: 'qweasd'
)

5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    admin: false,
    active: true,
    password: 'qweasd',
    password_confirmation: 'qweasd'
  )
  category = Category.create!(
    title: Faker::Name.name,
    description: Faker::Lorem.sentence
  )

  place = Place.create!(
    title: Faker::Name.name,
    description: Faker::Lorem.sentence,
    category_id: category.id,
    user_id: user.id,
    terms: true,
    active: true
  )
end

