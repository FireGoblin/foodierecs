require 'spec_helper'

describe "restaurants/edit.html.erb" do
  before(:each) do
    @restaurant = assign(:restaurant, stub_model(Restaurant,
      :name => "MyString",
      :address => "MyString",
      :street_number => "MyString",
      :street => "MyString",
      :phone => "MyString",
      :lat => 1.5,
      :long => 1.5,
      :icon => "MyString",
      :google_id => "MyString",
      :reference => "MyString",
      :type1 => "MyString",
      :type2 => "MyString",
      :type3 => "MyString",
      :type4 => "MyString",
      :url => "MyString",
      :vicinity => "MyString",
      :rating => 1.5,
      :foodie_likes => "",
      :foodie_dislikes => "",
      :normal_likes => "",
      :normal_dislikes => ""
    ))
  end

  it "renders the edit restaurant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => restaurants_path(@restaurant), :method => "post" do
      assert_select "input#restaurant_name", :name => "restaurant[name]"
      assert_select "input#restaurant_address", :name => "restaurant[address]"
      assert_select "input#restaurant_street_number", :name => "restaurant[street_number]"
      assert_select "input#restaurant_street", :name => "restaurant[street]"
      assert_select "input#restaurant_phone", :name => "restaurant[phone]"
      assert_select "input#restaurant_lat", :name => "restaurant[lat]"
      assert_select "input#restaurant_long", :name => "restaurant[long]"
      assert_select "input#restaurant_icon", :name => "restaurant[icon]"
      assert_select "input#restaurant_google_id", :name => "restaurant[google_id]"
      assert_select "input#restaurant_reference", :name => "restaurant[reference]"
      assert_select "input#restaurant_type1", :name => "restaurant[type1]"
      assert_select "input#restaurant_type2", :name => "restaurant[type2]"
      assert_select "input#restaurant_type3", :name => "restaurant[type3]"
      assert_select "input#restaurant_type4", :name => "restaurant[type4]"
      assert_select "input#restaurant_url", :name => "restaurant[url]"
      assert_select "input#restaurant_vicinity", :name => "restaurant[vicinity]"
      assert_select "input#restaurant_rating", :name => "restaurant[rating]"
      assert_select "input#restaurant_foodie_likes", :name => "restaurant[foodie_likes]"
      assert_select "input#restaurant_foodie_dislikes", :name => "restaurant[foodie_dislikes]"
      assert_select "input#restaurant_normal_likes", :name => "restaurant[normal_likes]"
      assert_select "input#restaurant_normal_dislikes", :name => "restaurant[normal_dislikes]"
    end
  end
end
