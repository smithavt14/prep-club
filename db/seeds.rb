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

User.destroy_all
puts "Deleted all prior users"

max_participants = (1..20).to_a
tags = ["healthy", "vegan", "vegetarian", "meat", "protein", "high-calorie"]

prep_photos = ['https://images.pexels.com/photos/76093/pexels-photo-76093.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/46239/salmon-dish-food-meal-46239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/8500/food-dinner-pasta-spaghetti-8500.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/718742/pexels-photo-718742.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350']

people_photos = ['https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/213117/pexels-photo-213117.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']

prep_descriptions = ["Join us on Saturday for an afternoon of cooking! We'll be cooking my mother's famous recipe. If you're a vegan, you're more than welcome!", "If you're into good friends, good times, and good eats, this is the event for you! Come to our club meeting this Wednesday for some fun in the sun.", "Wine, meat, and cheese. What else could a girl want? Come on over for some afternoon fun.", "I've been a body builder for the last four years, throughout this time I've always wanted to find friends to do meal prepping together. Finally this platform has given me the opportunity! Looking forward to meeting you all later on.", "This is a strictly vegan event. If you even bring just one slice of cheese, you will be extracated from the premises. Yes, extracated is a word. Look it up."]



10.times do
  @prep = Prep.new(
    name: Faker::SiliconValley.company,
    description: prep_descriptions.sample,
    max_participants: max_participants.sample,
    recipe_name: Faker::Food.dish,
    time: Faker::Time.forward(23, :night),
    location: Faker::Address.full_address,
    photo: prep_photos.sample
  )
  @user = User.new(
    email: Faker::Internet.email,
    password: "123123", #min 6 characters
    name: Faker::Name.name,
    bio: Faker::GreekPhilosophers.quote,
    gender: Faker::Gender.binary_type,
    location: Faker::Address.city,
  )
  @user.remote_photo_url = people_photos.sample
  @user.save
  @prep.user = @user
  @prep.remote_photo_url = prep_photos.sample
  @prep.tag_list.add(tags.sample(3))
  @prep.save
  puts "created seed..."
end

puts "Created 10 instances of Meal Prep Events"
