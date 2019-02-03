# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

Faker::Config.locale = 'fr'

20.times do |index|
  s = User.create(email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
end

10.times do |index|
  s = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

City.all.each do |index|
  5.times do |list|
    puts "We're in #{index.id} here"
    list = Listing.create(available_beds: rand(1..5), price: rand(10..100), description: Faker::Lorem.paragraph(10), has_wifi: Faker::Boolean.boolean, welcome_message: Faker::Lorem.sentence, city_id: index.id, admin_id: rand(1..20))
  end
end



Listing.all.each do |index|
  starting = Faker::Date.backward(60)
  ending = starting + rand(3..10)
  s = Reservation.create(start_date: starting, end_date: ending, guest_id: User.all.sample.id, listing_id: index.id)
end

Listing.all.each do |index|
  starting = Faker::Date.forward(60)
  ending = starting + rand(3..10)
  s = Reservation.create(start_date: starting, end_date: ending, guest_id: User.all.sample.id, listing_id: index.id)
end
