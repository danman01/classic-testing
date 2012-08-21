require 'spec_helper'

describe "owners/show" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :name => "Name",
      :gender => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
