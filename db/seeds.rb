# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Lifestyle.destroy_all
Review.destroy_all
User.destroy_all

nicolas = User.create(email: "ni.fraisse@gmail.com", password:"123456", photo:"https://ichef.bbci.co.uk/news/320/cpsprodpb/1404C/production/_108369918_393c6a43-2a4f-4ef8-b113-983b552b98e2.jpg")
fred = User.create(email: "fred@gmail.com", password:"123456", photo:"https://ichef.bbci.co.uk/news/320/cpsprodpb/1404C/production/_108369918_393c6a43-2a4f-4ef8-b113-983b552b98e2.jpg")
# Lifestyle.create!(name: "Plumber", description: "Be Mario for a few days", price: 4, address: '799  George Street, Peterborough', user: nicolas, photo:)
# Lifestyle.create!(name: "Fred", description: "Play golf all day long", price: 10, address: '3 avenue saint laurent, Montreal', user: nicolas,photo:)
# Lifestyle.create!(name: "Dwayne Johnson", description: "Who need a description ?", price: 1000, address: '100 baker street', user: nicolas,photo:)
# Lifestyle.create!(name: "Dog", description: "Be a dog", price: 25, user: nicolas,photo:)
url = "https://ichef.bbci.co.uk/news/624/cpsprodpb/3DA1/production/_96777751_c0220207-red-eyed_treefrog-spl.jpg"
lifestyle = Lifestyle.new(name: "Frog", description: "Be a frog", price: 2895, user: nicolas, address: "Montreal,QC")
lifestyle.remote_photo_url = url
lifestyle.save


url = "https://www.medicalnewstoday.com/content//images/articles/322/322868/golden-retriever-puppy.jpg"
lifestyle = Lifestyle.new(name: "dogg", description: "Be a dog", price: 8, user: fred, address: "New York, USA")
lifestyle.remote_photo_url = url
lifestyle.save






puts "done"



