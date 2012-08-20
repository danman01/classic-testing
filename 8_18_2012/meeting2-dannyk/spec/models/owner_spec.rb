require 'spec_helper'

describe Owner do
  subject { FactoryGirl.build(:owner, name: 'Rocko')}
  
  its(:name) { should == "Rocko"}
  
  describe "validations" do
    before do |owner|
      owner1 = FactoryGirl.create(:owner, :name=>"Rocko")
      @owner2 = FactoryGirl.build(:owner, :name=>"Rocko")
      
    end
    
    it "should have a unique name" do
      @owner2.should_not be_valid
    end
  end
  
  describe "associations" do
    before do |owner|
      @owner = FactoryGirl.create(:owner)
    end
    
    it "should have 4 pets" do
      4.times do @owner.pets << FactoryGirl.create(:pet) 
      end
      @owner.pets.count.should eql(4)
    end
  end
        
end
