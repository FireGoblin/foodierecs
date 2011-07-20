require 'spec_helper'

describe "feeds/index.html.erb" do
  before(:each) do
    assign(:feeds, [
      stub_model(Feed,
        :feed_id => "",
        :user_id => ""
      ),
      stub_model(Feed,
        :feed_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of feeds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
