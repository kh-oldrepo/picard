require 'spec_helper'

describe "encounters/index" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter,
        :name => "Name"
      ),
      stub_model(Encounter,
        :name => "Name"
      )
    ])
  end

  it "renders a list of encounters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
