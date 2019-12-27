class Place < ApplicationRecord
  has_many :creatures
  has_many :monsters
  has_many :characters
end
