require 'spec_helper'

describe "encounters/show" do
  before(:each) do
    @encounter = assign(:encounter, stub_model(Encounter,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
