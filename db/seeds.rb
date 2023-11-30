# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Bike.destroy_all
Component.destroy_all
Check.destroy_all
BikeComponent.destroy_all
BikeShop.destroy_all

# # components
puts "creating components"

chain = Component.create(
  name: "Chain",
  time_until_check: 4,
  distance_until_check: 400.00,
  check_advice: "You can check for chain wear with a ruler. It's a little easier if you go with imperial measurement here because one complete chain link of a standard chain measures 1in. Start at one link pin and measure 12 complete links. You need to put some tension on the chain to be accurate. On a standard new chain, 12 complete links will measure 12in, but when a chain is worn the 12in mark of the ruler won't quite reach the relevant link pin.If the distance from the 12in mark to the centre of the link pin is less than 1/16in, your chain is fine, but if it gets to 1/8in (or 2/16) mark it has gone beyond the point at which it needs replacing.",
  custom: false
)

# chain.photo.attach(io: File.open('app/assets/images/check_chain.jpg'), filename: "check_chain.jpg", content_type: "image/jpg")
puts "Created #{chain.name}"

tyre = Component.create(
  name: "Tyre",
  time_until_check: 1,
  distance_until_check: 150.0,
  check_advice: "The easiest way to check is to pinch each side of your tire to see the amount of pressure. Put a finger on each side of the tire and try to touch them together with the tire in between. This will be different depending on the tires you have but what you're looking for is your fingers to only move a couple of mm max. If you have a lot of flex, you will more than likely need to get more air in.",
  custom: false
)

# tyre.photo.attach(io: File.open('app/assets/images/pinch_test.jpg'), filename: "pinch_test.jpg", content_type: "image/jpg")
puts "Created #{tyre.name}"

brake_pad = Component.create(
  name: "Brake Pad",
  time_until_check: 4,
  distance_until_check: 1000.0,
  check_advice: "A simple visual inspection of the brake assembly should allow you to determine how much brake pad material remains.Shine a flashlight or other bright light onto the brake assembly so you can clearly see the brake pad backing, brake pads, and rotor. If very little brake pad thickness remains and the brake pad backing is almost touching the rotor, it's time to replace your brake pads.",
  custom: false
)

# brake_pad.photo.attach(io: File.open('app/assets/images/check_brake_pads.jpg'), filename: "check_brake_pads.jpg", content_type: "image/jpg")
puts "Created #{brake_pad.name}"

puts "Finished creating core components"


# users
puts "creating users"
user1 = User.create first_name: "Joe", last_name: "Bloggs", email: "joe@tyred.com", password: "123456"
user2 = User.create first_name: "Mark", last_name: "Cavendish", email: "mark@tyred.com", password: "654321"
user3 = User.create first_name: "Andy", last_name: "Schleck", email: "andy@tyred.com", password: "246810"
puts "Finished creating users"


# bikes
puts "creating bikes"

bike1 = Bike.create(
  make: "Specialized",
  model: "Allez",
  user_id: user1.id
)
bike1.photo.attach(io: File.open('app/assets/images/specialized_allez.jpg'), filename: "specialized-allez.jpg", content_type: "image/jpg")
puts "Created #{bike1.make}"

bike2 = Bike.create(
  make: "Nero",
  model: "Cappuccino",
  user_id: user1.id
)
bike2.photo.attach(io: File.open('app/assets/images/nero_cappuccino.jpg'), filename: "nero_cappuccino.jpg", content_type: "image/jpg")
puts "Created #{bike2.make}"

bike3 = Bike.create(
  make: "Brompton",
  model: "C Line Explore",
  user_id: user2.id
)
bike3.photo.attach(io: File.open('app/assets/images/brompton_explore.jpg'), filename: "brompton_explore.jpg", content_type: "image/jpg")
puts "Created #{bike3.make}"

bike4 = Bike.create(
  make: "Mango",
  model: "Disc Brake Commuter Bike",
  user_id: user2.id
)
bike4.photo.attach(io: File.open('app/assets/images/mango.jpg'), filename: "mango.jpg", content_type: "image/jpg")
puts "Created #{bike4.make}"

puts "Finished creating bikes"

bike5 = Bike.create(
  make: "Bobbin",
  model: "Hummingbird",
  user_id: user3.id
)
bike5.photo.attach(io: File.open('app/assets/images/hummingbird.jpg'), filename: "hummingbird..jpg", content_type: "image/jpg")
puts "Created #{bike5.make}"
puts "Finished creating bikes"

# components
puts "creating components"

chain = Component.create(
  name: "Chain",
  time_until_check: 30.0,
  distance_until_check: 400.0,
  check_advice: "You can check for chain wear with a ruler. It's a little easier if you go with imperial measurement here because one complete chain link of a standard chain measures 1in. Start at one link pin and measure 12 complete links. You need to put some tension on the chain to be accurate. On a standard new chain, 12 complete links will measure 12in, but when a chain is worn the 12in mark of the ruler won't quite reach the relevant link pin.If the distance from the 12in mark to the centre of the link pin is less than 1/16in, your chain is fine, but if it gets to 1/8in (or 2/16) mark it has gone beyond the point at which it needs replacing.",
  custom: false
)

chain.check_img.attach(io: File.open('app/assets/images/check_chain.jpg'), filename: "check_chain.jpg", content_type: "image/jpg")
chain.icon.attach(io: File.open('app/assets/images/bike_chain.png'), filename: "bike_chain.png", content_type: "image/png")

puts "Created #{chain.name}"

tyre = Component.create(
  name: "Tyre",
  time_until_check: 30.0,
  distance_until_check: 150.0,
  check_advice: "The easiest way to check is to pinch each side of your tire to see the amount of pressure. Put a finger on each side of the tire and try to touch them together with the tire in between. This will be different depending on the tires you have but what you're looking for is your fingers to only move a couple of mm max. If you have a lot of flex, you will more than likely need to get more air in.",
  custom: false
)

tyre.check_img.attach(io: File.open('app/assets/images/pinch_test.jpeg'), filename: "pinch_test.jpeg", content_type: "image/jpeg")
tyre.icon.attach(io: File.open('app/assets/images/bike_tyre.png'), filename: "bike_tyre.png", content_type: "image/png")
puts "Created #{tyre.name}"

brake_pad = Component.create(
  name: "Brake Pad",
  time_until_check: 90.0,
  distance_until_check: 1000.0,
  check_advice: "A simple visual inspection of the brake assembly should allow you to determine how much brake pad material remains. Shine a flashlight or other bright light onto the brake assembly so you can clearly see the brake pad backing, brake pads, and rotor. If very little brake pad thickness remains and the brake pad backing is almost touching the rotor, it's time to replace your brake pads.",
  custom: false
)

brake_pad.check_img.attach(io: File.open('app/assets/images/check_brake_pads.jpg'), filename: "check_brake_pads.jpg", content_type: "image/jpg")
brake_pad.icon.attach(io: File.open('app/assets/images/brake_pad.png'), filename: "brake_pad.png", content_type: "image/png")
puts "Created #{brake_pad.name}"

puts "Finished creating core components"

# Could add some extra components here that will appear in dropdown menu?

# bike_components
puts "creating bike components"
bike_component1 = BikeComponent.create(
  distance_travelled: 0.0,
  custom_time_check_interval: 20,
  date_added: Date.today - 17
)
bike_component1.component = chain
bike_component1.bike = bike1
bike_component1.save!

bike_component2 = BikeComponent.create(
  distance_travelled: 0.0,
  custom_time_check_interval: 20,
  date_added: Date.today - 4
)
bike_component2.component = tyre
bike_component2.bike = bike1
bike_component2.save!

bike_component3 = BikeComponent.create(
  distance_travelled: 0.0,
  custom_time_check_interval: 20,
  date_added: Date.today - 20
)
bike_component3.component = brake_pad
bike_component3.bike = bike1
bike_component3.save!

puts "Finished creating bike components"

# checks
puts "creating checks"

check_chain = Check.create(
  check_date: Date.today - 1.day,
  distance_threshold: 300,
  passed: true,
  bike_component: bike_component1
)

check_tyre = Check.create(
  check_date: Date.today - 1.day,
  distance_threshold: 100,
  passed: true,
  bike_component: bike_component2
)

check_brake_pads = Check.create(
  check_date: Date.today - 1.day,
  distance_threshold: 250,
  passed: true,
  bike_component: bike_component3
)

puts "Creating bike shops"

shop1 = BikeShop.create(
  name: "Apex Cycles",
  location: "Clapham",
  rating: 5,
  website: "www.apexcycles.com",
  phone_number: 02076221334
)

shop2 = BikeShop.create(
  name: "Brick Lane Bikes",
  location: "Shoreditch",
  rating: 3,
  website: "www.bricklanebikes.com",
  phone_number: 02030223002
)

shop3 = BikeShop.create(
  name: "Condor Cycles",
  location: "Holborn",
  rating: 5,
  website: "www.condorcycles.com",
  phone_number: 02035465302
)

shop4 = BikeShop.create(
  name: "L' Atelier Du Vélo",
  location: "Dulwich",
  rating: 5,
  website: "www.lduvelo.com",
  phone_number: 02034345665
)

shop5 = BikeShop.create(
  name: "Brixton Cycles",
  location: "Brixton",
  rating: 4,
  website: "www.brixtoncycles.com",
  phone_number: 02077336055
)

shop6 = BikeShop.create(
  name: "Bon Velo",
  location: "Herne Hill",
  rating: 4,
  website: "www.bonvelo.com",
  phone_number: 02056611002
)

shop7 = BikeShop.create(
  name: "Edwardes",
  location: "Camberwell",
  rating: 2,
  website: "www.edwardes.com",
  phone_number: 02077033676
)

puts "Finished creating bike shops"

puts "Finished!"
