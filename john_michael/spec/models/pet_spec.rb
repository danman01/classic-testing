require 'spec_helper'

describe Pet do
  describe "factory" do
    it "should be saved" do
      expect(FactoryGirl.create(:pet)).to be_persisted
    end
  end
  
  describe "validations" do
    let(:requirements) do
      {
        :date_of_birth => 13.days.ago.to_date, 
        :name => "Fido",
        :owner => FactoryGirl.build(:owner)
      }
    end
    subject { described_class.new requirements }

    it "saves with requirements" do
      subject.should be_valid
    end
    
    it "requires date_of_birth" do
      subject.date_of_birth = nil
      expect(subject.valid?).to be_false
    end
    
    it "requires name" do
      subject.name = nil
      expect(subject.valid?).to be_false
    end
    
    it "requires owner" do
      subject.owner = nil
      expect(subject.valid?).to be_false
    end
  end
  
  describe "associations" do
    it "has an owner" do
      described_class.new.should respond_to :owner
    end
  end
end
