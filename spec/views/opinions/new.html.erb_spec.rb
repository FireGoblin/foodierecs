require 'spec_helper'

describe "opinions/new.html.erb" do
  before(:each) do
    assign(:opinion, stub_model(Opinion,
      :user_id => "",
      :restaurant_id => "",
      :foodie => false,
      :like => "",
      :to_eat => "MyString",
      :to_drink => "MyString"
    ).as_new_record)
  end

  it "renders new opinion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => opinions_path, :method => "post" do
      assert_select "input#opinion_user_id", :name => "opinion[user_id]"
      assert_select "input#opinion_restaurant_id", :name => "opinion[restaurant_id]"
      assert_select "input#opinion_foodie", :name => "opinion[foodie]"
      assert_select "input#opinion_like", :name => "opinion[like]"
      assert_select "input#opinion_to_eat", :name => "opinion[to_eat]"
      assert_select "input#opinion_to_drink", :name => "opinion[to_drink]"
    end
  end
end
