class Sighting < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird
  
  validates :bird_id, presence: true
end
