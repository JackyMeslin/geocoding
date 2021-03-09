# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
alignement_de_kerlescan = Megalith.new(
  name: "Alignements de Kerlescan",
  # category: "Alignement Menhir",
  latitude: "47.60373",
  longitude: "-3.05048"
)
alignement_de_kerlescan.save!

puts "Alignement de Kerlescan created!"
