require 'spec_helper'

describe "encounters/edit" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :name => "MyString"
    ))
  end

  it "renders the edit encounter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => encounters_path(@encounter), :method => "post" do
      assert_select "input#encounter_name", :name => "encounter[name]"
    end
  end
end
