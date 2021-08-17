# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#You will have to add a User first and then a Pokespot, a Booking and finally the review (in this order)
Review.create!(booking_id: 1, rating: 5, comments: "ah oui oui!")
puts "Finished!"
