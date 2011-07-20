require 'spec_helper'

describe "opinions/index.html.erb" do
  before(:each) do
    assign(:opinions, [
      stub_model(Opinion,
        :user_id => "",
        :restaurant_id => "",
        :foodie => false,
        :like => "",
        :to_eat => "To Eat",
        :to_drink => "To Drink"
      ),
      stub_model(Opinion,
        :user_id => "",
        :restaurant_id => "",
        :foodie => false,
        :like => "",
        :to_eat => "To Eat",
        :to_drink => "To Drink"
      )
    ])
  end

  it "renders a list of opinions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To Eat".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To Drink".to_s, :count => 2
  end
end
