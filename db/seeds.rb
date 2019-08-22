# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Lifestyle.destroy_all
User.destroy_all


nicolas = User.create(email: "ni.fraisse@gmail.com", password:"123456")
Lifestyle.create!(name: "Plumber", description: "Be Mario for a few days", price: 4, address: '799  George Street, Peterborough', user: nicolas)
Lifestyle.create!(name: "Fred", description: "Play golf all day long", price: 10, address: '3 avenue saint laurent, Montreal', user: nicolas)
Lifestyle.create!(name: "Dwayne Johnson", description: "Who need a description ?", price: 1000, address: '100 baker street', user: nicolas)
Lifestyle.create!(name: "Dog", description: "Be a dog", price: 25, user: nicolas)
Lifestyle.create!(name: "Frog", description: "Be a frog", price: 2895, user: nicolas)

puts "done"
