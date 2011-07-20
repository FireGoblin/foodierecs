require 'spec_helper'

describe "feeds/new.html.erb" do
  before(:each) do
    assign(:feed, stub_model(Feed,
      :feed_id => "",
      :user_id => ""
    ).as_new_record)
  end

  it "renders new feed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feeds_path, :method => "post" do
      assert_select "input#feed_feed_id", :name => "feed[feed_id]"
      assert_select "input#feed_user_id", :name => "feed[user_id]"
    end
  end
end
