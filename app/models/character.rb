class Character < ApplicationRecord
  belongs_to :user
  belongs_to :god
  belongs_to :place
end
