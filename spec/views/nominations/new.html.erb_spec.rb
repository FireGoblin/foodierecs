require 'spec_helper'

describe "nominations/new.html.erb" do
  before(:each) do
    assign(:nomination, stub_model(Nomination,
      :user_id => "",
      :vote => false,
      :voter => "",
      :nominator => false
    ).as_new_record)
  end

  it "renders new nomination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nominations_path, :method => "post" do
      assert_select "input#nomination_user_id", :name => "nomination[user_id]"
      assert_select "input#nomination_vote", :name => "nomination[vote]"
      assert_select "input#nomination_voter", :name => "nomination[voter]"
      assert_select "input#nomination_nominator", :name => "nomination[nominator]"
    end
  end
end
