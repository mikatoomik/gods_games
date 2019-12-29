class CreateMonsterJob < ApplicationJob
  queue_as :default

  def perform
    name = ["gob", "orc", "urukai", "troll"].sample
    case name
    when "urukai"
      att = rand(5..10)
      defense = rand(5..10)
      stamina = rand(15..20)
    when "orc"
      att = rand(3..8)
      defense = rand(3..8)
      stamina = rand(6..15)
    when "troll"
      att = rand(10..20)
      defense = rand(8..14)
      stamina = rand(25..40)
    else
      att = rand(3..5)
      defense = rand(1..4)
      stamina = rand(4..9)
    end
    place = Place.all.sample
    Monster.create!(name: name, att: att, def: defense, stamina: stamina, place: place)
  end
end
