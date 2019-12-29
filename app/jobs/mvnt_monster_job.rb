class MvntMonsterJob < ApplicationJob
  queue_as :default

  def perform(monster_id)
    monster = Monster.find(monster_id)
    if monster.living
      monster.place = Place.find_by(name: monster.place.links.sample)
      monster.save
    end
  end
end
