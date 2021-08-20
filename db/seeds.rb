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

ADDRESSES = ["702 1st Street, Libertyville, Illinois, United States of America", "8266 Lake Peigneur Road, Jefferson Island, Louisiana, United States of America", "206 Tor-an-Eas, Glenfinnan, Scotland, United Kingdom", "129 Harrington Road, Akron, Ohio, United States of America", "173 Road Runner Lane, California, California, United States of America", "44 US 95, Las Vegas, Nevada, United States of America", "4049 Higdon Road, Nashville-Davidson, Tennessee, United States of America", "52 Farm to Market Road 1311, Twentymile Crossing, Texas, United States of America", "73 Antelope Creek Road, Lincoln, Nebraska, United States of America", "56 North Fork Road, Colorado, Colorado, United States of America", "501 Lake Road East Fork, Hamlin, New York, United States of America", "13 County Road 13, Colorado, Colorado, United States of America", "32 Rue Maurice Lachatre, Drancy, Île-de-France, France", "136 Chemin de la Bassière, Saint-Georges-d'Espéranche, Auvergne-Rhône-Alpes, France", "112 Route de Bédarrides, Sorgues, Provence-Alpes-Côte d'Azur, France", "146 Route de Joeuf, Montois-la-Montagne, Grand-Est, France", "62 Chemin des Peyroules, Cournonterral, Occitanie, France", "48 Rue des Boutons d'Or, Saint-Paul, La Réunion, France",  "Antananarivo", "Sydney", "Jakarta", "Benjing", "Shanghai", "Tokyo", "81 rue Blanche 75009, France", "12 allée des myosotis, Montmagny", "Perth", "Boston", "New-york City", "Jersey", "Bombay", "Doha", "St. Petersburg, Florida, United States of America", "Saint Petersburg, Санкт-Петербург, Russia", "Alger", "Tunis", "Kinshasa, Democratic Republic of the Congo", "Rue de Tanzanie, La Possession, La Réunion, France", "Dodoma", "Tanzania", "Puerto Natales, Región de Magallanes y de la Antártica Chilena, Chile", "Cartagena, Bolívar, Colombia", "Santa Cruz de la Sierra, Santa Cruz, Bolivia", "Mexico", "Panama", "Cuba", "Martinique", "Montreal", "Quebec", "argentina", "La Paz", "Belgrad", "Stockholm", "Amsterdam", "Berlin", "Munich", "Warsaw, województwo mazowieckie, Poland", "Kabul", "Samara", "Uzbekistan", "Mongolia", "Bhutan", "Hong-Kong", "Davao", "Papete", "Sao Paulo", "Balsas", "Liberia", "Juba"]

puts "10 Users created!"

puts "Creating 30 Pokespots"

30.times do
  Pokespot.create!(
    name: Faker::Games::Pokemon.unique.location,
    address: ADDRESSES.sample,
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
