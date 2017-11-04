# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do |i|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    name = first_name + " " + last_name
    displayName = name.delete(' ').downcase!
    email = Faker::Internet.email
    User.create(first_name: first_name, last_name: last_name, display_name: displayName, email: email, password: "password", password_digest: "password")
end
