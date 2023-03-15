# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def seed(file)
  load Rails.root.join("db","seeds", "#{file}.rb")
end

puts "Seeding #{Rails.env}..."

unless Rails.env.production?
  seed "users"
end

puts "Seeding done"
