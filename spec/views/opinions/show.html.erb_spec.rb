require 'spec_helper'

describe "opinions/show.html.erb" do
  before(:each) do
    @opinion = assign(:opinion, stub_model(Opinion,
      :user_id => "",
      :restaurant_id => "",
      :foodie => false,
      :like => "",
      :to_eat => "To Eat",
      :to_drink => "To Drink"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To Eat/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To Drink/)
  end
end
