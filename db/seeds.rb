# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Fill the DB with some instances we can use

puts "Cleaning the DB..."
Restaurant.destroy_all

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Creating #{CATEGORIES.count} Restaurants..."
CATEGORIES.shuffle.each do |category|
  Restaurant.create!(
    name: Faker::Restaurant.unique.name,
    address: Faker::Address.street_address,
    category: category,
  )
end
puts "... created #{Restaurant.count} restaurants"
