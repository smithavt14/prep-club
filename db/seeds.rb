# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed for Meal Prep Events...

Prep.destroy_all
puts "Deleted all prior preps"

max_participants = (1..20).to_a


10.times do
  @prep = Prep.new(
    name: Faker::SiliconValley.company,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam iusto commodi amet eos recusandae ea animi dicta quas explicabo aperiam, impedit praesentium maxime eum optio numquam delectus, cumque molestiae? Nobis!",
    max_participants: max_participants.sample,
    meal: Faker::Food.dish,
    time: Faker::Time.forward(23, :night),
    location: Faker::Address.full_address,
  )
  @prep.user = User.create(
    email: Faker::Internet.email,
    password: "123123", #min 6 characters
    name: Faker::Name.name,
    bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam iusto commodi amet eos recusandae ea animi dicta quas explicabo aperiam, impedit praesentium maxime eum optio numquam delectus, cumque molestiae? Nobis!",
    gender: Faker::Gender.binary_type,
    location: Faker::Address.city,
  )
  @prep.save
end

puts "Created 10 instances of Meal Prep Events"
