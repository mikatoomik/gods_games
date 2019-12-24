Character.delete_all

Place.delete_all

Place.create!(name: "zone", links: ["lieu1"])
Place.create!(name: "lieu1", links: ["lieu2"])
Place.create!(name: "lieu2", links: ["lieu1", "lieu3"])
Place.create!(name: "lieu3", links: ["lieu2"])


God.delete_all

God.create!(name: "Dieu1")
God.create!(name: "Dieu2")

User.delete_all

User.create!(email: "mika@atoomik.fr", password: "password")


puts "#{Place.count} places created"
puts "#{God.count} Gods created"
puts "#{User.count} users created"
puts "#{Character.count} Characters created"
