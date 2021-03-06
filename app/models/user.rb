class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  
  has_many :sightings
  has_many :birds, through: :sightings
  
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
end
