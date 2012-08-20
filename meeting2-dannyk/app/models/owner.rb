class Owner < ActiveRecord::Base
  attr_accessible :birthday, :gender, :name
  validates_uniqueness_of :name
  
  has_many :pets
end
