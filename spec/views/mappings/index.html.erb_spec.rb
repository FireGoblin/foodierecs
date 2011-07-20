require 'spec_helper'

describe "mappings/index.html.erb" do
  before(:each) do
    assign(:mappings, [
      stub_model(Mapping,
        :restaurant_id1 => "",
        :restaurant_id2 => "",
        :foodies => "",
        :nonfoodie => ""
      ),
      stub_model(Mapping,
        :restaurant_id1 => "",
        :restaurant_id2 => "",
        :foodies => "",
        :nonfoodie => ""
      )
    ])
  end

  it "renders a list of mappings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
