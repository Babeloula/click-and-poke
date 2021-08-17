# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#You will have to add a User first and then a Pokespot, a Booking and finally the review (in this order)

puts "Cleaning database..."


User.destroy_all
puts "All record Destroyed"
puts "____________________________"
puts "Creating Users"

user1 = User.new(email: "user1@test.com", username: "TamTam", password: "tototo")
user1.save!
user2 = User.new(email: "user2@test.com", username: "MatLaMenace", password: "tototo")
user2.save!
user3 = User.new(email: "user3@test.com", username: "Pierrot", password: "tototo")
user3.save!

puts "#{user1.username} created!"
puts "#{user2.username} created!"
puts "#{user3.username} created!"

pokespot1 = Pokespot.new(name: "Kanto", address: "Chez Sacha", description: "C'est bien!", scarcity_drop_level: 70, price: 2, pokemon_type: "Fire", user: user1)
pokespot1.save!
puts "#{pokespot1.name} created!"
pokespot2 = Pokespot.new(name: "Mon Jardin", address: "16 villa Gaudelet", description: "C'est cool!", scarcity_drop_level: 50, price: 10, pokemon_type: "Water", user: user2)
pokespot2.save!
puts "#{pokespot2.name} created!"

puts "Finished!"
