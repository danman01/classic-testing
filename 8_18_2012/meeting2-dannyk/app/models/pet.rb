class Pet < ActiveRecord::Base
  attr_accessible :birthday, :kind, :name
  
  belongs_to :owner
end
