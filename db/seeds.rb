# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

40.times do |i|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    name = first_name + " " + last_name
    displayName = name.delete(' ').downcase!
    email = Faker::Internet.email
    image = Faker::Avatar.image
    user=User.create(first_name: first_name, last_name: last_name, display_name: displayName, email: email, password: "password", password_confirmation: "password")
    random=5 + rand(20)
    (1..rand).each do
      description = Faker::Name.first_name
      name = Faker::Name.last_name
      tags=["design","photos","idk","Lol"]
      for tag in tags
        portfolio=user.create(Portfolio.new(name: name, description: description, tag_list: tags))
      end
  end

end
