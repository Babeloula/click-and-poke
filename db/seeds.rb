# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#You will have to add a User first and then a Pokespot, a Booking and finally the review (in this order)
require "faker"

puts "Cleaning database..."

User.destroy_all
Pokespot.destroy_all
Booking.destroy_all
puts "All record Destroyed"
puts "____________________________"
puts "Creating 10 Users"

User.create!(
  email: "sacha@pokemon.com",
  username: "Sacha",
  password: "password",
  rank: "Master"
)

10.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    username: Faker::Name.unique.first_name,
    password: "password",
    rank: User::RANK.sample
  )
  user.save!
end

puts "10 Users created!"

puts "Creating 30 Pokespots"

30.times do
  Pokespot.create!(
    name: Faker::Games::Pokemon.unique.location,
    address: Faker::Address.unique.city,
    description: Faker::JapaneseMedia::OnePiece.quote,
    scarcity_drop_level: rand(1..100),
    price: rand(1..500),
    pokemon_type: Pokespot::TYPES.sample,
    user_id: User.all.sample.id
  )
end
puts "30 Pokespots created!"

puts "Creating 100 Bookings"

100.times do
  booking = Booking.new(
    start_date: Faker::Date.between(from: 3.days.ago, to: 1.day.from_now),
    end_date: Faker::Date.between(from: 1.day.ago, to: 5.days.from_now),
    pokespot_id: Pokespot.all.sample.id,
    user_id: User.all.sample.id,
    status: [0, 1].sample
  )
  booking.save!
end
puts "100 Bookings created!"

puts "Creating 300 Reviews"

300.times do
  review = Review.new(
    rating: rand(2..5),
    comments: Faker::TvShows::MichaelScott.quote,
    booking_id: Booking.all.sample.id
  )
  review.save!
end
puts "300 Bookings created!"

puts "Finished!"
