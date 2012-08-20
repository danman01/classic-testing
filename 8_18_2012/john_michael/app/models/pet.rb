class Pet < ActiveRecord::Base
  attr_accessible :date_of_birth, :name, :owner_id, :owner
  
  belongs_to :owner
  
  validates :date_of_birth, :presence => true 
  validates :name, :presence => true
  validates :owner, :presence => true

end
