require 'spec_helper'

describe "restaurants/show.html.erb" do
  before(:each) do
    @restaurant = assign(:restaurant, stub_model(Restaurant,
      :name => "Name",
      :address => "Address",
      :street_number => "Street Number",
      :street => "Street",
      :phone => "Phone",
      :lat => 1.5,
      :long => 1.5,
      :icon => "Icon",
      :google_id => "Google",
      :reference => "Reference",
      :type1 => "Type1",
      :type2 => "Type2",
      :type3 => "Type3",
      :type4 => "Type4",
      :url => "Url",
      :vicinity => "Vicinity",
      :rating => 1.5,
      :foodie_likes => "",
      :foodie_dislikes => "",
      :normal_likes => "",
      :normal_dislikes => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Icon/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Google/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reference/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type4/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vicinity/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
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
