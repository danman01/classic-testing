require 'spec_helper'

describe "owners/new" do
  before(:each) do
    assign(:owner, stub_model(Owner,
      :name => "MyString",
      :gender => 1
    ).as_new_record)
  end

  it "renders new owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => owners_path, :method => "post" do
      assert_select "input#owner_name", :name => "owner[name]"
      assert_select "input#owner_gender", :name => "owner[gender]"
    end
  end
end
