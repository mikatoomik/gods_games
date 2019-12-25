Creature.delete_all
God.delete_all
Place.delete_all
User.delete_all

Place.create!(name: "zone", links: ["lieu1"])
Place.create!(name: "lieu1", links: ["lieu2"])
Place.create!(name: "lieu2", links: ["lieu1", "lieu3"])
danger = Place.create!(name: "lieu3", links: ["lieu2"])

god = God.create!(name: "Dieu1")
God.create!(name: "Dieu2")

User.create!(email: "mika@atoomik.fr", password: "password")

Monster.create!(name: "gob", att: 2, def: 1, stamina: 5, place: danger)
Monster.create!(name: "orc", att: 3, def: 2, stamina: 10, place: danger)
Monster.create!(name: "urukai", att: 10, def: 5, stamina: 20, place: danger)

puts "#{Place.count} places created"
puts "#{God.count} Gods created"
puts "#{User.count} users created"
puts "#{Monster.count} monsters created"
puts "#{Character.count} Characters created"
