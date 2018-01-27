class Bird < ActiveRecord::Base
  has_many :sightings
  has_many :users, through: :sightings
  
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
end
