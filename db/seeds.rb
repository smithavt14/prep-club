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

prep_photos = ["https://images.unsplash.com/photo-1482932973216-15c6808e8691?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=601b630df8bea4fbc1628b410c32376f&auto=format&fit=crop&w=1567&q=80", "https://images.unsplash.com/photo-1457393568996-e452740c8346?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d9fcb386597db5dfa31416a5a9f1cf3f&auto=format&fit=crop&w=1650&q=80", "https://images.unsplash.com/photo-1499218727621-7642e7bfa048?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2e7ff743555225d4a18300bc230af8f8&auto=format&fit=crop&w=1598&q=80", "https://images.pexels.com/photos/7443/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=350", "https://images.pexels.com/photos/1222459/pexels-photo-1222459.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/273850/pexels-photo-273850.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350", "https://images.pexels.com/photos/1005371/pexels-photo-1005371.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "https://images.pexels.com/photos/1253589/pexels-photo-1253589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"]

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
