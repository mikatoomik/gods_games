class Creature < ApplicationRecord
  belongs_to :place
  before_save :default_values
  def default_values
    self.att = 1 if self.att.nil?
    self.def = 1 if self.def.nil?
    self.stamina = 10 if self.stamina.nil?
    self.living = true if self.living.nil?
  end

end
