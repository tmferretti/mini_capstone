# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
100.times do |product1|
  product1 = Product.new(name: Faker::Commerce.product_name, image: Faker::Placeholdit.image, description: Faker::RickAndMorty.quote, price: Faker::Commerce.price.to_i)
  product1.save
end
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
