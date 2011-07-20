require 'spec_helper'

describe "mappings/show.html.erb" do
  before(:each) do
    @mapping = assign(:mapping, stub_model(Mapping,
      :restaurant_id1 => "",
      :restaurant_id2 => "",
      :foodies => "",
      :nonfoodie => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
