class Sighting < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird
  
  validates :bird_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
