require 'spec_helper'

describe Owner do
  
  describe "factory" do
    it "should be saved" do
      expect(FactoryGirl.create(:owner)).to be_persisted
    end
  end
  
  describe "validations" do
    let(:requirements) { { :email => "john@gothca.com", :first_name => "John", :last_name => "Maxwell" } }
    subject { described_class.new requirements }
    
    it "is valid if all requirements are met" do
      subject.should be_valid
    end
    
    it "requires email" do
      subject.email = nil
      subject.valid?.should be_false
    end
    
    it "requires first_name" do
      subject.first_name = nil
      subject.valid?.should be_false
    end
    
    it "requires last_name" do
      subject.last_name = nil
      subject.valid?.should be_false
    end
  end
end
