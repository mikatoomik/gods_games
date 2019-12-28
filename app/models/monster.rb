class Monster < Creature
  after_destroy :async_create # Run on create & update

  private

  def async_mvnt
    MvntMonsterJob.perform_later(self.id)
  end
  def async_create
    CreateMonsterJob.perform_later
  end

end
